//
//  ViewController.swift
//  School Application
//
//  Created by Thai Huy on 17/06/2023.
//

import UIKit
import SnapKit
import Combine

class LoginViewController: UIViewController {
    private let logoView = LogoView()
    private let accountView = AccountView()
    private let passwordView = PasswordView()
    private let signInView = SignInView()
    private lazy var vStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [
            UIView(),
            logoView,
            accountView,
            passwordView,
            signInView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 50
        return stackView
    }()
    
    private var subscriptions: Set<AnyCancellable> = []
    
    var account: String = ""
    var password: String = ""
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.autoLayout()
        
        let input = LoginViewModel.Input(
            signInPublisher: signInView.valuePublisher,
            accountPublisher: accountView.valuePublisher,
            passwordPublisher: passwordView.valuePublisher
        )
        
        let output = viewModel.transform(input: input)
        output.signInResult.sink { [weak self] detailUser in
            let DetailedAccountViewController = DetailedAccountViewController(user: detailUser)
                DetailedAccountViewController.modalPresentationStyle = .fullScreen
            self?.present(DetailedAccountViewController, animated: false, completion: nil)
        }.store(in: &subscriptions)
        
    }

    private func autoLayout() {
        view.backgroundColor = ThemeColor.bg
        view.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        logoView.snp.makeConstraints { make in
            make.height.equalTo(77)
        }
        
        accountView.snp.makeConstraints { make in
            make.height.equalTo(62)
        }
        
        passwordView.snp.makeConstraints { make in
            make.height.equalTo(62)
        }
        
        signInView.snp.makeConstraints { make in
            make.height.equalTo(62)
        }
    }

}

