//
//  DefaultLayout.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/11.
//

import SwiftUI

struct DefaultLayout: View {
    @State var title: String = "타이틀 들어가는 곳"
    @State var buttonText: String = "버튼 텍스트"
    
    var body: some View {
        VStack {
            Text("\(title)")
                .font(.title2)
                .foregroundColor(Color("MainTextColor"))
                
            ZStack {
                RoundedRectangle(cornerRadius: 4).fill(Color("GrayBoxColor"))
                Text("contents")
            }.padding(.top, 20.0)
            
            HStack {
                Button(action: {}){
                    Text("\(buttonText)")
                        .foregroundColor(Color.white)
                }
                .frame(width: 120.0, height: 40.0)
                .background(Color("MainColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            .padding(.top, 20.0)
        }
        .padding([.leading, .trailing], 20.0)
        .padding([.top], 60.0)
    }
}

struct DefaultLayout_Previews: PreviewProvider {
    static var previews: some View {
        DefaultLayout()
    }
}
