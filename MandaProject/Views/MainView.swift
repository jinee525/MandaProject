//
//  MainView.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/13.
//

import SwiftUI
import CoreData

func getDayOfWeek(date: Date) -> Int {
    let formatter = DateFormatter()
    formatter.dateFormat = "EE"
    switch formatter.string(from: date) {
        case "Mon": return 0;
        case "Tus": return 1;
        case "Wed": return 2;
        case "Thu": return 3;
        case "Fri": return 4;
        case "Sat": return 5;
        default: return 6;
    }
}

struct MainView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var goal: FetchedResults<Goal>
    @FetchRequest(sortDescriptors: []) var action: FetchedResults<Action>
    
    var todayDayIndex = getDayOfWeek(date: Date())
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                if(goal.isEmpty){
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 80.0, height: 80.0)
                    
                    Spacer()
                    HStack() {
                        
                        NavigationLink {
                            CreateGoal().navigationBarHidden(true)
                        } label: {
                            Text("시작하기")
                                .foregroundColor(Color("MainColor"))
                                .frame(maxWidth: .infinity)
                        }
                        .frame(width: 120.0, height: 40.0)
                    }
                } else {
                    Text("오늘 할 일")
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .padding(.top, 60.0)
                    
                    if action.count == 0 {
                        Text("할 일이 없어요!")
                    } else {
                        ScrollView{
                            VStack(spacing: 20.0){
                                ForEach(action) { action in
                                    if(action.repeatDay!.compactMap{$0.wholeNumberValue}[todayDayIndex] == 1) {
                                        Text(action.title!)
                                            .frame(maxWidth: .infinity)
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
                        
                        NavigationLink {
                            SubGoalList().navigationBarHidden(true)
                        } label: {
                            Image("Logo")
                                .resizable()
                                .frame(width: 40.0, height: 40.0)
                        }
                        .padding()
                    
                    }
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

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
