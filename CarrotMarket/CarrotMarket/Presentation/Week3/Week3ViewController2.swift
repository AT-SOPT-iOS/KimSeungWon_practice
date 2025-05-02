//
//  Week3ViewController2.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/26/25.
//

import UIKit

import SnapKit
import Then

class Week3ViewController2: UIViewController {
    
    // MARK: - Properties
    
    private var itemList = ItemModel.dummy()
    
    // MARK: - UI Properties
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        
        setCollectionViewFlowLayout()
        setDelegate()
        setRegister()
    }
    
    private func setStyle() {
        collectionView.do {
            $0.backgroundColor = .white
        }
    }
    
    private func setUI() {
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewFlowLayout() {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: 198)
        flowlayout.minimumLineSpacing = 0
        flowlayout.minimumInteritemSpacing = 0
        collectionView.setCollectionViewLayout(flowlayout, animated: true)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setRegister() {
        collectionView.register(Week3CollectionViewCell.self, forCellWithReuseIdentifier: Week3CollectionViewCell.identifier)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension Week3ViewController2: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MARK: - UICollectionViewDataSource

extension Week3ViewController2: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Week3CollectionViewCell.identifier,
            for: indexPath
        ) as? Week3CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.dataBind(itemList[indexPath.row], itemRow: indexPath.row)
        return cell
    }
}

// MARK: - Week3CollectionViewCellDelegate

extension Week3ViewController2: Week3CollectionViewCellDelegate {
    func heartButtonDidTap(state: Bool, row: Int) {
        itemList[row].heartIsSelected = state
    }
}

