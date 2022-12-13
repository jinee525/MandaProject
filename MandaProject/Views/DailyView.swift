//
//  DailyView.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct DailyView: View {
    @State var goal: String = "달성 목표"
    @State var doneActions: [Int] = [0,0,1,0,0,1,0]

    var dailyActionList: [DailyActionItem] = {
        var list: [DailyActionItem] = []
        list.append(DailyActionItem(title: "action 1"))
        list.append(DailyActionItem(title: "action 2"))
        list.append(DailyActionItem(title: "action 3"))
        list.append(DailyActionItem(title: "action 4"))
        list.append(DailyActionItem(title: "action 5"))
        return list
    }()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text("오늘의 액션")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                
                VStack(spacing: 20.0){
                    ForEach(dailyActionList) { action in
                        Text(action.title)
                            .frame(maxWidth: .infinity)
                            .padding(.all, 12.0)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }.padding(.all, 18.0)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .background(Color(.systemGray6))
                Spacer()
                HStack() {
                    Button(action: {}){
                        Text("저장")
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
    
    class DailyActionItem: Identifiable {
        var id = UUID()
        var title: String
        
        init(title: String) {
            self.title = title
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
