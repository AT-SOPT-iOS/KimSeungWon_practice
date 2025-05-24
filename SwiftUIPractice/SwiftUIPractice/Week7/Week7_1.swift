//
//  Week7_1.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/24/25.
//

import SwiftUI

struct Week7_1: View {
    
    @State private var isSheetPresented = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Button {
                isSheetPresented = true
            } label: {
                Text("시트")
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetDetailView(isSheetPresented: $isSheetPresented)
        }
    }
}

#Preview {
    Week7_1()
}
