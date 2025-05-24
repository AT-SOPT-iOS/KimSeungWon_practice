//
//  Week7_2.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/24/25.
//

import SwiftUI

struct Week7_2: View {
    
    // MARK: - Properties
    
    let rows = [
        GridItem(.flexible(minimum: 10, maximum: .infinity), spacing: 0)
    ]
    
    let columns = [
        GridItem(.flexible(minimum: 10, maximum: .infinity), spacing: 10),
        GridItem(.flexible(minimum: 10, maximum: .infinity), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows, alignment: .center, spacing: 10) {
                        ForEach (0..<10) { _ in
                            HGridCell()
                        }
                    }
                    .padding(.horizontal, 10)
                }
                
                LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                    ForEach (0..<20) { index in
                        VGridCell(index: index)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .background(.gray)
    }
}

// MARK: - Subviews

struct VGridCell: View {
    
    var index: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Color(.red)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("아이템 \(index + 1)")
        }
        .padding(10)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct HGridCell: View {
    var body: some View {
        Color(.orange)
            .frame(width: 150, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

#Preview {
    Week7_2()
}
