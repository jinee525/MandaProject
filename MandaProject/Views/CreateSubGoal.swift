//
//  CreateSubGoal.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct CreateSubGoal: View {
    @State var subGoal: String = ""
    
    var subGoalList: [SubGoalItem] = {
        var list: [SubGoalItem] = []
        list.append(SubGoalItem(title: "세부 목표 1"))
        list.append(SubGoalItem(title: "세부 목표 2"))
        return list
    }()
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("세부 목표 리스트")
                .font(.title2)
                .foregroundColor(Color.black)
                .padding(.top, 60.0)
            
            
            List(subGoalList) { item in
                HStack {
                    Text(item.title)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
            
            Spacer()
            
            HStack() {
                Button(action: {}){
                    Text("저장")
                        .foregroundColor(Color.white)
                }
                .padding(0.0)
                .frame(width: 120.0, height: 40.0)
                .background(Color("MainColor"))
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding([.leading, .trailing], 20.0)
    }
}

class SubGoalItem: Identifiable {
    var id = UUID()
    var title: String
    
    
    init(title: String) {
        self.title = title
    }
}

struct CreateSubGoal_Previews: PreviewProvider {
    static var previews: some View {
        CreateSubGoal()
    }
}
