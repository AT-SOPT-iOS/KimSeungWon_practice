//
//  ScrollViewPractice.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/17/25.
//

import SwiftUI

struct ScrollViewPractice: View {
    
    @State var name: String = "승원"
    
    var body: some View {
        VStack {
            
            Text(name)
            NameChangeView(name: $name)
        }
    }
}

struct NameChangeView: View {
    
    @Binding var name: String
    
    var body: some View {
        Button {
            name = "원승"
        } label: {
           Text("이름 바꾸기 ㅋㅋ")
        }
    }
}

#Preview {
    ScrollViewPractice()
}
