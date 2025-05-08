//
//  Week4ViewController.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/3/25.
//

import UIKit

import SnapKit

final class Week4ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let authService = AuthService.shared
    private let userService = UserService.shared

    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""
    
    private var userId: Int = -1 {
        didSet {            
            fetchNickname()
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: - Functions
    
    @objc private func infoViewButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }
    
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }
    
    @objc
    private func registerButtonTap() {
        Task {
            do {
                guard let response = try await authService.signup(
                    requestBody: RegisterRequestDTO(
                        loginId: self.loginId,
                        password: self.password,
                        nickname: self.nickName
                    )
                ), let data = response.data else {
                    return
                }
                
                let alert = UIAlertController(
                    title: "계정 생성 성공",
                    message: "환영합니다, \(data.nickname)님! (ID: \(data.userId))",
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "계정 생성 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    @objc
    private func signinButtonDidTap() {
        Task {
            do {
                guard let response = try await authService.signin(
                    requestBody: SigninRequestDTO(
                        loginId: self.loginId,
                        password: self.password
                    )
                ), let data = response.data else {
                    return
                }
                
                userId = data.userId
                
                let alert = UIAlertController(
                    title: "로그인 성공",
                    message: "환영합니다, (ID: \(data.userId))",
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    @objc
    private func nicknameButtonDidTap() {
        Task {
            do {
                guard let _ = try await userService.changeNickname(
                    requestBody: ChangeNicknameRequestDTO(nickname: nickName),
                    userId: userId
                ) else {
                    return
                }
                
                fetchNickname()
                
                let alert = UIAlertController(
                    title: "닉네임 바꾸기 성공",
                    message: "",
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
            } catch {
                let alert = UIAlertController(
                    title: "닉네임 바꾸기 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    // MARK: - Functions
    
    private func fetchNickname() {
        Task {
            do {
                guard let response = try await userService.fetchMyNickname(
                    userId: userId
                ), let data = response.data else {
                    return
                }
                
                loginStatusLabel.text = "로그인 상태입니다. \(data.nickname)"
            } catch {
                loginStatusLabel.text = "로그인 상태가 아닙니다."
            }
        }
    }
    
    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubviews(stackView, loginStatusLabel)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(150)
        }
        
        [idTextField, passwordTextField, nickNameTextField, registerButton, signinButton, infoViewButton, nicknameButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        loginStatusLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - UI Properties
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }
    
    private lazy var idTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디를 입력하슈"
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
    }
    
    private lazy var nickNameTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "닉네임을 입력하슈"
    }
    
    private lazy var registerButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
    }
    
    private lazy var signinButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.addTarget(self, action: #selector(signinButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var infoViewButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(infoViewButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .white
    }
    
    private lazy var nicknameButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(nicknameButtonDidTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("닉네임 변경", for: .normal)
        $0.titleLabel?.textColor = .white
    }
    
    private let loginStatusLabel = UILabel().then {
        $0.text = "로그인 상태가 아닙니다"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 25, weight: .semibold)
        $0.textColor = .black
    }
}
