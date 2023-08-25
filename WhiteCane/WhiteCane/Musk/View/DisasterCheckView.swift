//
//  DisasterCheckView.swift
//  WhiteCane
//
//  Created by A_Mcflurry on 2023/08/25.
//

import SwiftUI

struct DisasterCheckView: View {
    @State private var isPressed: Bool = false
    let dummy: [String] = ["[울진군] 현재 평해읍,기성면(시간당 60㎜이상) 중심으로 많은 비가 내리고있습니다. 위험징후 인지 즉시 가까운 마을회관으로 즉시 대피하시기 바랍니다."
                           ,"[김천시] 산사태주의보 발령, 호우로 산사태 위험이 높으므로 기상 및 주변상황을 수시로 확인하시고 대피명령 있을시 마을회관 등 안전한 곳으로 대피바랍니다."
                           ,"[성주군] 성주군 산사태 주의보 발령. 산림, 급경사지 등 위험지역 주민 및 방문객은 유사시 대피장소 또는 안전지대로 반드시 대피해 주시기 바랍니다"
                           ,"[상주시] (호우주의보 발효 중)많은 비가 예상되오니 급경사지, 산사태 위험지역, 하천둔치 등에 대한 출입을 금지하고 안전한 지역으로 사전대피하여 주시기바랍니다."
                           ,"[울진군] 17:50 울진평지 호우주의보 발효. 산사태 상승침수 등 위험지역 대피, 외출자제 등 안전에 주의하시기 바립니다. "
                           ,"[영덕군] 내일 오전까지 많은 비가 예상되므로 하천, 계곡, 해안가, 급경사지 등 위험지역 출입을 삼가하여 주시고, 퇴근길 안전 운전에 주의하여 주시기 바랍니다."
                           ,"[영덕군] 오늘 17시50분 경북(울진평지,영덕) 호우주의보 발효. 대중교통을 이용하시고 빗길 안전에 주의하시기 바랍니다."
    ]
    
    let dummyDate: [String] = ["2023.08.24. 23:29"
                               ,"2023.08.24. 22:30"
                               ,"2023.08.24. 22:30"
                               ,"2023.08.24. 20:42"
                               ,"2023.08.24. 18:20"
                               ,"2023.08.24. 18:16"
                               ,"2023.08.24. 18:10"
    ]
    
    var body: some View {
        VStack {
            Text("재난문자 확인하기")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            
            HStack {
                Text("지역 선택")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                ButtonView(text: "경상북도") {}
                    .frame(width: 206, height: 50)
            }
            
            ButtonView(text: "조회하기", textColor: .black) {
                isPressed.toggle()
            }
            .frame(height: 100)
            if isPressed {
                List {
                    ScrollView {
                        ForEach(0..<dummy.count) { item in
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.yellowCustom)
                                .frame(width: 320, height: 150)
                                .overlay {
                                    VStack(alignment: .leading) {
                                        Text("\(dummy[item])")
                                        
                                        HStack {
                                            Spacer()
                                            Text("\(dummyDate[item])")
                                        }
                                    }.padding()
                                }
                                .padding(.bottom)
                        }
                    }
                }
                
            } else {
                Spacer()
            }
            
        }
    }
}

struct DisasterCheckView_Previews: PreviewProvider {
    static var previews: some View {
        DisasterCheckView()
            .preferredColorScheme(.dark)
    }
}
