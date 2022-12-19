//
//  CreateGoal.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct CreateGoal: View {
    @Environment(\.managedObjectContext) var managedObjContext

    
    @State var title: String = ""
    @State var due: Date = Date()
    @State var tag:Int? = nil

    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text("목표 설정하기")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                
                
                VStack(spacing: 20.0){
                    TextField("이루고 싶은 목표를 적어주세요.", text: $title)
                        .padding(.all, 12.0)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    DatePicker(selection: $due, in: Date()..., displayedComponents: .date) {
                        Text("목표 달성일")
                    }
                }.padding(.all, 18.0)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .background(Color(.systemGray6))
                Spacer()
                
                HStack() {
                    NavigationLink(destination:  SubGoalList().navigationBarHidden(true).onAppear {
                            DataController().addGoal(title: title, due: due, context: managedObjContext)
                        }, label: {
                        Text("저장")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                        } )
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

struct CreateGoal_Previews: PreviewProvider {
    static var previews: some View {
        CreateGoal()
    }
    
}
