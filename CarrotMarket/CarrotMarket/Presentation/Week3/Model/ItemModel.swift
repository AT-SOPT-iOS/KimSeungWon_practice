//
//  ItemModel.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/26/25.
//

import UIKit

struct ItemModel {
    let itemImage: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(
                itemImage: .capucino,
                name: "퉁퉁퉁사후르",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "오쏘몰",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "애플워치",
                price: "5000",
                heartIsSelected: true
            ),
            ItemModel(
                itemImage: .capucino,
                name: "가방",
                price: "5000",
                heartIsSelected: true
            ),
            ItemModel(
                itemImage: .capucino,
                name: "헤드셋",
                price: "5000",
                heartIsSelected: true
            ),
            ItemModel(
                itemImage: .capucino,
                name: "틴트",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "카메라",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "로션",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "락스",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "가방",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "헤드셋",
                price: "5000",
                heartIsSelected: false
            ),
            ItemModel(
                itemImage: .capucino,
                name: "틴트",
                price: "5000",
                heartIsSelected: false
            )
        ]
    }
}
