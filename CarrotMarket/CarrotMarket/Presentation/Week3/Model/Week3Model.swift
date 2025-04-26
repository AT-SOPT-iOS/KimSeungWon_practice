//
//  Week3Model.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/26/25.
//

import UIKit

struct Week3Model {
    let profileImage: UIImage
    let name: String
    let place: String
    let message: String
    let itemImage: UIImage
}

extension Week3Model {
    static func dummy() -> [Week3Model] {
        return [
            Week3Model(
                profileImage: .minji,
                name: "김가현",
                place: "광진구",
                message: "내말에답장해줘",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "김현수",
                place: "여의도",
                message: "마크내사랑",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "서주영",
                place: "잠실",
                message: "마크내꺼",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "권석기",
                place: "회기",
                message: "나는 민경훈",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "김나연",
                place: "미국",
                message: "타코팔러가야돼",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "정정욱",
                place: "중국",
                message: "보쌈정식13000원",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "서상원",
                place: "일본",
                message: "잠실의주인은두산이다",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "임재현",
                place: "태국",
                message: "뒷풀이갈게",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "이은지",
                place: "명왕성",
                message: "은지야술먹자",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "성현주",
                place: "안드로메다",
                message: "응애~",
                itemImage: .watch
            ),
            Week3Model(
                profileImage: .minji,
                name: "김한열",
                place: "뭘보슈",
                message: "생일추카해한열오빠",
                itemImage: .watch
            )
        ]
    }
}
