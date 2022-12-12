//
//  ActionDetail.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct ActionDetail: View {
    @Environment(\.dismiss) private var dismiss
    @State var action: String = ""
    @State var due: Date = Date()
    
    @State var dates: [String] = ["월", "화", "수", "목", "금", "토", "일"]
    @State var selectedDates: [Int] = [0,0,1,0,0,1,0]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text("반복 액션")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                
                VStack(spacing: 20.0){
                    TextField("세부 목표 달성을 위한 액션을 적어주세요.", text: $action)
                        .padding(.all, 12.0)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    DatePicker(selection: $due, in: Date()..., displayedComponents: .date) {
                        Text("액션 종료일")
                        
                    }
                    HStack{
                        ForEach(0..<7){id in
                            if selectedDates[id] == 1 {
                                Button(action: {selectedDates[id] = 0 }, label:{Text(dates[id])})
                                    .frame(width: 36.0, height: 36.0)
                                    .background(Color("MainColor"))
                                    .clipShape(Circle())
                                    .foregroundColor(Color.white)
                            } else {
                                Button(action: {selectedDates[id] = 1 }, label:{Text(dates[id])})
                                    .frame(width: 36.0, height: 36.0)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                .foregroundColor(Color.black)

                            }
                        }
                    }
                    
                }.padding(.all, 18.0)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .background(Color(.systemGray6))
                
                Spacer()
                HStack() {
                    Button(action: {dismiss()}, label: {
                        Text("돌아가기")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                    })
                    .padding(0.0)
                    .frame(width: 120.0, height: 40.0)
                    .background(Color(.systemGray3))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    Button(action: {}){
                        Text("저장하기")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(0.0)
                    .frame(width: 120.0, height: 40.0)
                    .background(Color("MainColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .padding([.leading, .trailing], 20.0)
        }
    }
}

struct ActionDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActionDetail()
    }
}
