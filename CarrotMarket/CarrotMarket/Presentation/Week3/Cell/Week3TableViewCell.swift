//
//  Week3TableViewCell.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/26/25.
//

import UIKit

import SnapKit
import Then

class Week3TableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "Week3Cell"
    
    // MARK: - UI Properties
    
    private let profileImageView = UIImageView()
    
    private let nameLabel = UILabel()
    
    private let placeLabel = UILabel()
    
    private let chatLabel = UILabel()
    
    private let itemImageView = UIImageView()

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 이거는 선택할 때 ㄷㄷ...
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        contentView.backgroundColor = selected == true ? .green : .white
    }
    
    // 와 이거 꾹 누르면 색 바뀌게 하는 거네
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        contentView.backgroundColor = highlighted == true ? .brown : .white
    }
    
    // MARK: - UI Setting
    
    private func setStyle() {
        nameLabel.do {
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .boldSystemFont(ofSize: 15)
        }
        
        placeLabel.do {
            $0.textColor = .gray
            $0.textAlignment = .left
            $0.font = .boldSystemFont(ofSize: 12)
        }
        
        chatLabel.do {
            $0.textColor = .black
            $0.textAlignment = .left
            $0.font = .boldSystemFont(ofSize: 14)
        }
    }
    
    private func setUI() {
        contentView.addSubviews(profileImageView, nameLabel, placeLabel, chatLabel, itemImageView)
    }
    
    private func setLayout() {
        
        profileImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16.5)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nameLabel).offset(2)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        
        itemImageView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }
}

// MARK: - Functions

extension Week3TableViewCell {
    func dataBind(_ chatData: Week3Model) {
        profileImageView.image = chatData.profileImage
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = chatData.itemImage
    }
}
