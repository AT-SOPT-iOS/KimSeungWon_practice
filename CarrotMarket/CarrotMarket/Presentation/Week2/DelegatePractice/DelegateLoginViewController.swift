//
//  DelegateLoginViewController.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/13/25.
//

import UIKit

final class DelegateLoginViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네리서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .pretendard(.bold, size: 16)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = .pretendard(.regular, size: 14)
        textField.backgroundColor = .systemGray6
        textField.addLeftView()
        textField.configureDefaultTextField()
        textField.roundCorners(6)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = .pretendard(.regular, size: 14)
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.addLeftView()
        textField.configureDefaultTextField()
        textField.roundCorners(6)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 332, height: 58))
        button.backgroundColor = .orange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendard(.bold, size: 18)
        button.roundCorners(6)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
    }
}

// MARK: - Functions

extension DelegateLoginViewController {
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton
        )
    }
    
    private func presentToWelcomeViewController() {
        let viewController = DelegateWelcomeViewController()
        viewController.modalPresentationStyle = .formSheet
        viewController.setLabelText(idTextField.text)
        self.present(viewController, animated: true)
    }
    
    private func pushToWelcomeViewController() {
        let viewController = DelegateWelcomeViewController()
        viewController.delegate = self
        viewController.setLabelText(idTextField.text)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeViewController()
    }
}

extension DelegateLoginViewController: DelegateWelcomeViewControllerDelegate {
    func dataBind(id: String) {
        print("delegate로 받은 id: \(id)")
    }
}
