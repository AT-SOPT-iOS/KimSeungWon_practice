//
//  CarrotVIew.swift
//  SwiftUIPractice
//
//  Created by 김승원 on 5/17/25.
//

import SwiftUI

struct CarrotVIew: View {
    
    let dummyData: [ChatModel] = chatDummy
    
    var body: some View {
        List(dummyData) { data in
            CarrotCell(data: data)
        }
        .listStyle(.plain)
    }
}

#Preview {
    CarrotVIew()
}

struct CarrotCell: View {
    
    let data: ChatModel
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .center, spacing: 0) {
                Image(data.profileImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 3) {
                    Text(data.name)
                        .font(.headline)
                    
                    Text(data.location)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Text(data.message)
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 0) {
                Image(data.thumbnailImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}

struct ChatModel: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let message: String
    let profileImageName: String
    let thumbnailImageName: String
}

let chatDummy: [ChatModel] = [
    ChatModel(name: "바보", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "김가현", location: "구의동", message: "넵 수고하세용", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "이은지", location: "보문동2가", message: "안녕하세요 답장이 너무 늦었네요 죄송…", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "최주리", location: "면목동", message: "부리님이 이모티콘을 보냈어요.", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "임재현", location: "자양제4동", message: "네.임재현씨", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "이수용", location: "옥수동", message: "이수용이 이모티콘을 보냈어요.", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "조영서", location: "면목동", message: "조영서가 이모티콘을 보냈어요.", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "선영주", location: "면목동", message: "선영주가 이모티콘을 보냈어요.", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "정정욱", location: "면목동", message: "ㅈㅇ정주우기 이모티콘을 보냈어요.", profileImageName: "profileImage", thumbnailImageName: "profileImage"),
    ChatModel(name: "진소은", location: "면목동", message: "진소으니 이모티콘을 보냈어요.", profileImageName: "profileImage", thumbnailImageName: "profileImage")
]
