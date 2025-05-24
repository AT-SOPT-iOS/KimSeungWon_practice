//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.profile)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
            
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("안녕하세요")
                        .font(.headline)
                    
                    Text("저는 김승원입니다")
                        .font(.caption)
                }
                
                Spacer()
            }
            .padding(5)
            .foregroundStyle(.primary)
            .background(.white.opacity(0.6))
        }
    }
}

#Preview {
    ContentView()
}
