//
//  SubGoalList.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI
import CoreData

struct SubGoalList: View {
    @Environment(\.dismiss) var dismiss

    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var subGoal: FetchedResults<SubGoal>
    
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20.0) {
                Text("세부 목표")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                if subGoal.count == 0 {
                    Text("세부 목표가 없어요!")
                        .foregroundColor(Color(.systemGray))
                } else {
                    ScrollView{
                        VStack(spacing: 20.0){
                            ForEach(subGoal) { subGoal in
                                NavigationLink {
                                    ActionList(subGoal:subGoal)
                                        .navigationBarHidden(true)
                                } label: {
                                    Text(subGoal.title!)
                                        .frame(maxWidth: .infinity)
                                        .padding(.all, 12.0)
                                        .background(Color(.systemGray6))
                                        .foregroundColor(Color.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                }
                            }
                        }
                    }
                    .frame(height:500)
                }
               
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
                    
                    NavigationLink {
                        CreateSubGoal().navigationBarHidden(true)
                    } label: {
                        Text("추가하기")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(width: 120.0, height: 40.0)
                    .background(Color("VivaMagenta"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .padding(.horizontal, 20.0)
            .padding(.bottom, 20.0)
        }
    }
}


struct SubGoalList_Previews: PreviewProvider {
    static var previews: some View {
        SubGoalList()
    }
}
