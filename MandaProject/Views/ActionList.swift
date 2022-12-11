//
//  ActionList.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct ActionList: View {
    @Environment(\.dismiss) private var dismiss
    @State var action: String = ""

    var actionList: [ActionItem] = {
        var list: [ActionItem] = []
        list.append(ActionItem(title: "action 1"))
        list.append(ActionItem(title: "action 2"))
        list.append(ActionItem(title: "action 3"))
        list.append(ActionItem(title: "action 4"))
        list.append(ActionItem(title: "action 5"))
        list.append(ActionItem(title: "action 6"))
        list.append(ActionItem(title: "action 7"))
        list.append(ActionItem(title: "action 8"))
        list.append(ActionItem(title: "action 9"))
        list.append(ActionItem(title: "action 10"))
        return list
    }()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text("액션 리스트")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                ScrollView{
                    VStack(spacing: 20.0){
                        ForEach(actionList) { action in
                            NavigationLink {
                                ActionDetail()
                                    .navigationBarHidden(true)
                            } label: {
                                Text(action.title)
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
                        Text("추가하기")
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
        ActionList()
    }
}
