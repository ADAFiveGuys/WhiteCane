//
//  HealthInfoView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/26.
//

import SwiftUI

struct HealthInfoView: View {
    @State private var isPress: Bool = false
    @State private var name: String = ""
    @State private var disability: String = ""
    @State private var necessities: String = ""
    @State private var caution: String = ""
    @State private var phone: String = ""
    @State private var medicine: String = ""
    @State private var dosage: String = ""
    @State private var hospital: String = ""
    @State private var home: String = ""
    var body: some View {
        VStack {
            Text("건강정보카드")
                .font(.title)
                .fontWeight(.semibold)
            
            HStack(spacing: 0) {
                Button {
                    isPress = false
                } label: {
                    Rectangle()
                        .stroke(Color.yellowCustom)
                        .frame(width: 170, height: 60)
                        .overlay {
                            Text("앞면")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                }
                
                Button {
                    isPress = true
                } label: {
                    Rectangle()
                        .stroke(Color.yellowCustom)
                        .frame(width: 170, height: 60)
                        .overlay {
                            Text("뒷면")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.yellowCustom)
                .padding()
                .overlay {
                    VStack(alignment: .center, spacing: 45) {
                        if !isPress {
                            
                            HStack {
                                Text("이름")
                                TextField("", text: $name)
                                    .frame(width: 205)
                            }
                            
                            HStack {
                                Text("장애정보")
                                TextField("", text: $disability)
                                    .frame(width: 205)
                            }
                            
                            HStack {
                                Text("필수 지참\n물품")
                                TextField("", text: $necessities)
                                    .frame(width: 205)
                            }
                            
                            HStack {
                                Text("주의사항")
                                TextField("", text: $caution)
                                    .frame(width: 205)
                            }
                            
                            HStack {
                                Text("비상\n연락처")
                                TextField("", text: $phone)
                                    .frame(width: 205)
                            }
                        } else {
                            HStack {
                                Text("복용약")
                                TextField("", text: $medicine)
                                    .frame(width: 205)
                            }
                            
                            HStack {
                                Text("복용주기")
                                TextField("", text: $dosage)
                                    .frame(width: 205)
                            }
                            HStack {
                                Text("병원 이름\n및\n전화번호")
                                TextField("", text: $hospital)
                                    .frame(width: 205)
                            }
                            
                            HStack {
                                Text("집주소")
                                TextField("", text: $home)
                                    .frame(width: 205)
                            }
                            
                            HStack {
                                Text("")
                                TextField("", text: $home)
                                    .frame(width: 205)
                                    .disabled(true)
                            }
                        }
                    }
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                }
            
            ButtonView(text: "수정하기") {
                
            }
            .frame(height: 100)
        }
    }
}

struct HealthInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HealthInfoView()
            .preferredColorScheme(.dark)
    }
}
