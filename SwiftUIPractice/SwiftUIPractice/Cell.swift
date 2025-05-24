//
//  Cell.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/17/25.
//

import SwiftUI

struct Cell: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .bottomTrailing) {
                Image(.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button {
                    print("hello")
                } label: {
                    Image(systemName: "heart")
                }
            }
            
            HStack(spacing: 5) {
                Text("아이폰 13")
                Text("군자동 1동")
            }
            
            Text("1,000,000원")
        }
    }
}

#Preview {
    Cell()
}
