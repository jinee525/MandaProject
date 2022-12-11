//
//  SubGoalList.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct SubGoalList: View {
    @State var subGoal: String = ""

    var subGoalList: [SubGoalItem] = {
        var list: [SubGoalItem] = []
        list.append(SubGoalItem(title: "세부 목표 1"))
        list.append(SubGoalItem(title: "세부 목표 2"))
        list.append(SubGoalItem(title: "세부 목표 3"))
        list.append(SubGoalItem(title: "세부 목표 4"))
        list.append(SubGoalItem(title: "세부 목표 5"))
        list.append(SubGoalItem(title: "세부 목표 6"))
        list.append(SubGoalItem(title: "세부 목표 7"))
        list.append(SubGoalItem(title: "세부 목표 8"))
        list.append(SubGoalItem(title: "세부 목표 9"))
        list.append(SubGoalItem(title: "세부 목표 10"))
        return list
    }()
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20.0) {
                Text("세부 목표 리스트")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                ScrollView{
                    VStack(spacing: 20.0){
                        ForEach(subGoalList) { subGoal in
                            NavigationLink {
                                ActionList()
                                    .navigationBarHidden(true)
                            } label: {
                                Text(subGoal.title)
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
                
                Spacer()
                HStack() {
                    NavigationLink {
                        CreateSubGoal().navigationBarHidden(true)
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
}

class SubGoalItem: Identifiable {
    var id = UUID()
    var title: String
    
    
    init(title: String) {
        self.title = title
    }
}

struct SubGoalList_Previews: PreviewProvider {
    static var previews: some View {
        SubGoalList()
    }
}
