//
//  MLTestView.swift
//  WhiteCane
//
//  Created by 주환 on 2023/08/25.
//

import SwiftUI
import AVFoundation
import Vision

class CameraManager: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    var captureSession: AVCaptureSession?
    private var videoDataOutput: AVCaptureVideoDataOutput?
    private var shouldPerformDetection: Bool = true
    
    @Published var detectedObjectText: String = ""

    override init() {
        super.init()
        setupCaptureSession()
    }

    func startSession() {
        DispatchQueue.global(qos: .background).async {
            self.captureSession?.startRunning()
        }
    }

    func stopSession() {
        captureSession?.stopRunning()
    }

    private func setupCaptureSession() {
        captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession?.addInput(input)
        } catch {
            print(error.localizedDescription)
            return
        }

        videoDataOutput = AVCaptureVideoDataOutput()
        videoDataOutput?.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoDataOutputQueue"))
        captureSession?.addOutput(videoDataOutput!)
        
        do {
            try captureDevice.lockForConfiguration()
            captureDevice.activeVideoMinFrameDuration = CMTimeMake(value: 1, timescale: 1)
            captureDevice.unlockForConfiguration()
        } catch {
            print(error.localizedDescription)
        }
        
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard shouldPerformDetection else { return }
        DispatchQueue.global(qos: .background).async {
            guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            let model = try! VNCoreMLModel(for: MyTestML2().model)
            let request = VNCoreMLRequest(model: model) { request, error in
                if let results = request.results as? [VNRecognizedObjectObservation] {
                    let detectedText = results.map { observation in
                        "\(observation.labels[0].identifier) \(observation.confidence * 100)%"
                    }.joined(separator: "\n")
                    print(detectedText)
                    DispatchQueue.main.async {
                        if let highestConfidence = results.first?.confidence, highestConfidence >= 0.5 {
                            self.detectedObjectText = "현재 방향에 문이 있습니다."
                            print("문 o")
//                            self.shouldPerformDetection = false
                        } else {
                            self.detectedObjectText = "현재 방향에 문이 있지 않습니다."
                            print("문 x ")
                        }
                    }
                }
            }
            
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
            do {
                try handler.perform([request])
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct CameraView: View {
    @ObservedObject var cameraManager = CameraManager()

    var body: some View {
        VStack {
            CameraPreview(cameraManager: cameraManager)
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    cameraManager.startSession()
                }
                .onDisappear {
                    cameraManager.stopSession()
                }
            ZStack {
                ButtonView(text: "안내 종료하기") {
                    
                }.frame(height: 100)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.yellowCustom,lineWidth: 2)
                        .padding(.all, -1)
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.black)
                    Text(cameraManager.detectedObjectText)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                }.frame(height: 130)
                    .padding(.horizontal)
                    .offset(y:-340)
            }
            
        }
    }
}

struct CameraaView: View {
    var body: some View {
        NavigationView {
            CameraView()
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var cameraManager: CameraManager

    func makeUIView(context: Context) -> some UIView {
        let previewLayer = AVCaptureVideoPreviewLayer(session: cameraManager.captureSession!)
        previewLayer.videoGravity = .resizeAspectFill
        let view = UIView()
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let layer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer else { return }
        layer.frame = uiView.bounds
        layer.session = cameraManager.captureSession
    }

}

struct ObjectDetectionView_Previews: PreviewProvider {
    static var previews: some View {
        CameraaView()
    }
}


