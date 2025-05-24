//
//  SheetDetailView.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/24/25.
//

import SwiftUI

struct SheetDetailView: View {
    
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Button {
                isSheetPresented = false
            } label: {
                Text("시트 뷰 닫기")
            }
        }
        .clipShape(Capsule())
    }
}
