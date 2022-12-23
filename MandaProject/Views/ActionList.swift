//
//  ActionList.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI
import CoreData



struct ActionList: View {
    @Environment(\.dismiss) var dismiss
       
    var subGoal: SubGoal
    @FetchRequest var action: FetchedResults<Action>

    init(subGoal: SubGoal){
        self.subGoal = subGoal
        self._action = FetchRequest(
            entity: Action.entity(),
            sortDescriptors: [],
            predicate:NSPredicate(format: "subGoal == %@", subGoal)
        )
    }
    
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
                                    EditAction(action: action)
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
                        CreateAction(subGoal: subGoal).navigationBarHidden(true)
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
            .padding(.bottom, 20.0)
        }
        
    }
    
    
}

