//
//  CreateSubGoal.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct CreateSubGoal: View {
    @Environment(\.dismiss) private var dismiss
    @State var subGoal: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text("세부 목표 만들기")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                
                
                VStack(spacing: 20.0){
                    TextField("목표 달성을 위한 세부 목표를 적어주세요.", text: $subGoal)
                        .padding(.all, 12.0)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
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
                    
                    Button(action: {dismiss()}){
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

struct CreateSubGoal_Previews: PreviewProvider {
    static var previews: some View {
        CreateSubGoal()
    }
}
