//
//  DelegateWelcomeViewController.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/13/25.
//

import UIKit

protocol DelegateWelcomeViewControllerDelegate: AnyObject {
    func dataBind(id: String)
}

final class DelegateWelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private var id: String?
    weak var delegate: DelegateWelcomeViewControllerDelegate?
    
    // MARK: - UI Properties
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 100, width: 150, height: 150))
        imageView.image = .welcome
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 300, width: 236, height: 44))
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .pretendard(.bold, size: 18)
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = .orange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.roundCorners(6)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 488, width: 332, height: 58))
        button.backgroundColor = .systemGray6
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        button.roundCorners(6)
        return button
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        
        bindId()
    }
}

// MARK: - Functions

extension DelegateWelcomeViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(
            mainImageView,
            titleLabel,
            nextButton,
            backButton
        )
    }
    
    private func backToLoginViewController() {
        guard let id else { return }
        delegate?.dataBind(id: id)
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func bindId() {
        guard let id else { return }
        titleLabel.text = "\(id == "" ? "???" : id)님\n반가워요!"
    }
    
    func setLabelText(_ id: String?) {
        self.id = id
    }
    
    @objc
    private func backButtonDidTap() {
        backToLoginViewController()
    }
}
