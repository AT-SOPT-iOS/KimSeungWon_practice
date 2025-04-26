//
//  Week3CollectionViewCell.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/26/25.
//

import UIKit

protocol Week3CollectionViewCellDelegate: AnyObject {
    func heartButtonDidTap(state: Bool, row: Int)
}

final class Week3CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "Week3CollectionViewCell"
    var itemRow: Int?
    weak var delegate: Week3CollectionViewCellDelegate?
    
    // MARK: - UI Properties
    
    private let itemImageView = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(.heart, for: .normal)
        button.setImage(.profile, for: .selected)
        button.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
            contentView.addSubview($0)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
    
    @objc
    private func heartButtonDidTap() {
        heartButton.isSelected.toggle()
        
        if let itemRow {
            self.delegate?.heartButtonDidTap(
                state: self.heartButton.isSelected,
                row: itemRow
            )
        }
    }
}

extension Week3CollectionViewCell {
    func dataBind(_ item: ItemModel, itemRow: Int) {
        itemImageView.image = item.itemImage
        nameLabel.text = item.name
        priceLabel.text = item.price + "원"
        heartButton.isSelected = item.heartIsSelected
        self.itemRow = itemRow
    }
}
