//
//  ActionList.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI
import CoreData

struct ActionList: View {
    @Environment(\.dismiss) private var dismiss
    @FetchRequest(sortDescriptors: []) var action: FetchedResults<Action>

    var subGoalId: UUID
    var subGoalTitle: String
    var subGoal: SubGoal
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text(subGoal.title!)
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                
                if action.count == 0 {
                    Text("할 일이 없어요!")
                } else {
                    ScrollView{
                        VStack(spacing: 20.0){
                            ForEach(action) { action in
                                NavigationLink {
                                    ActionDetail()
                                        .navigationBarHidden(true)
                                } label: {
                                    Text(action.title!)
                                        .frame(maxWidth: .infinity)
                                        .padding(.all, 12.0)
                                        .background(Color.white)
                                        .foregroundColor(Color.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                }
                            }
                        }.padding(.all, 18.0)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .background(Color(.systemGray6))
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
                        ActionDetail().navigationBarHidden(true)
                    } label: {
                        Text("추가하기")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                    }
                    .frame(width: 120.0, height: 40.0)
                    .background(Color("MainColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .padding(.horizontal, 20.0)
        }
        
    }
    
    class ActionItem: Identifiable {
        var id = UUID()
        var title: String
        
        
        init(title: String) {
            self.title = title
        }
    }
}


struct ActionList_Previews: PreviewProvider {
    static var previews: some View {
        ActionList(subGoalId:UUID(),subGoalTitle: "NULL")
    }
}
