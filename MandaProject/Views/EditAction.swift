//
//  EditAction.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct EditAction: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjContext

    var action: FetchedResults<Action>.Element
    var dates: [String] = ["월", "화", "수", "목", "금", "토", "일"]

    @State var title: String = ""
    @State var due: Date = Date()
    
    @State var selectedDates: [Int] = [0,0,0,0,0,0,0]
    
    // for control field text focuesd
    enum Field: Hashable {
      case title
    }
    @FocusState private var focusField: Field?
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                Text("반복 액션")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .padding(.top, 60.0)
                
                VStack(spacing: 20.0){
                    TextField("\(action.title!)", text: $title)
                        .onAppear {
                            title = action.title!
                            due = action.due!
                            selectedDates = action.repeatDay!.compactMap{$0.wholeNumberValue}
                        }
                        .padding(.all, 12.0)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .focused($focusField, equals: .title)
                    HStack{
                        ForEach(0..<7){id in
                            if selectedDates[id] == 1 {
                                Button(action: {selectedDates[id] = 0 }, label:{Text(dates[id])})
                                    .frame(width: 36.0, height: 36.0)
                                    .background(Color("VivaMagenta"))
                                    .clipShape(Circle())
                                    .foregroundColor(Color.white)
                            } else {
                                Button(action: {selectedDates[id] = 1 }, label:{Text(dates[id])})
                                    .frame(width: 36.0, height: 36.0)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                .foregroundColor(Color.black)

                            }
                        }
                    }
                    DatePicker(selection: $due, displayedComponents: .date) {
                        Text("종료일")
                        
                    }
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
                    
                    Button(action: {
                        DataController().editAction(action: action, title: title, due: due, repeatDay: "\(selectedDates)", context: managedObjContext)
                        dismiss()}){
                        Text("저장하기")
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(0.0)
                    .frame(width: 120.0, height: 40.0)
                    .background(Color("VivaMagenta"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .padding([.leading, .trailing], 20.0)
            .padding(.bottom, 20.0)
            .onAppear {
                focusField = .title
            }
        }
    }
}

