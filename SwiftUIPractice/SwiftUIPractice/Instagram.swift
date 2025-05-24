//
//  Instagram.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/17/25.
//

import SwiftUI

struct Instagram: View {
    var body: some View {
        VStack(spacing: 0) {
            HorizontalScrollDM()
        }
    }
}

// MARK: - Subviews

struct HorizontalScrollDM: View {
    
    var horizontalData: [HorizontalModel] = HorizontalModel.mockData
    
    var body: some View {
        ScrollView(.horizontal) {
            List(horizontalData) { data in
                cell(data)
            }
        }
    }
}

struct horizontalCell: View {

    var data: HorizontalModel
    
    var body: some View: some View {
        ZStack(alignment: .bottomTrailing) {
            Image()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
        }
    }
}

// MARK: - Models

struct HorizontalModel: Identifiable {
    let id = UUID()
    let profileImageName: String
    let isActive: Bool
    
    static var mockData: [HorizontalModel] {
        return [
            HorizontalModel(profileImageName: "profileImage", isActive: true),
            HorizontalModel(profileImageName: "profileImage", isActive: false),
            HorizontalModel(profileImageName: "profileImage", isActive: false),
            HorizontalModel(profileImageName: "profileImage", isActive: true),
            HorizontalModel(profileImageName: "profileImage", isActive: false)
        ]
    }
}



#Preview {
    Instagram()
}
