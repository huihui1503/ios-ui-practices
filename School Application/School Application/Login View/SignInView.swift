//
//  SignInView.swift
//  School Application
//
//  Created by Thai Huy on 18/06/2023.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa

protocol ButtonTapProtocol: AnyObject {
    var valuePublisher: AnyPublisher<Bool, Never> { get }
}

final class SignInView: UIView {
    
    private lazy var signInButton: UIButton = {
        var button = UIButton()
        button.setTitle("SIGN IN", for: .normal)
        button.titleLabel?.textColor = ThemeColor.text
        button.backgroundColor = ThemeColor.primary
        button.tapPublisher.flatMap({
            Just(true)
        })
        .assign(to: \.value, on:signInSubject)
        .store(in: &cancellables)
        
        return button
    }()
    private var signInSubject = CurrentValueSubject<Bool,Never>(false)
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        super.init(frame: .zero)
        self.autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(signInButton)
        
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.width.equalTo(315)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        
    }
}

extension SignInView: ButtonTapProtocol {
    var valuePublisher: AnyPublisher<Bool, Never> {
        return signInSubject.eraseToAnyPublisher()
    }
}
