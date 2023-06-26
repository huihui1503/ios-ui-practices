//
//  AccountView.swift
//  School Application
//
//  Created by Thai Huy on 17/06/2023.
//

import UIKit
import SnapKit
import Combine


final class PasswordView: UIView {
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Password"
        label.textColor = ThemeColor.text
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.text = "1234"
        textField.textPublisher
            .assign(to: \.value, on: passwordSubject)
            .store(in: &cancellables)
        return textField
    }()
    
    private let horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [
        titleLabel,
        passwordTextField,
        horizontalLineView
        ])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private var passwordSubject = CurrentValueSubject<String?, Never>("1234")
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        super.init(frame: .zero)
        self.autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func autoLayout() {
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        horizontalLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(snp.width)
        }
    }
}

extension PasswordView: TextPublisherProtocol {
    var valuePublisher: AnyPublisher<String?, Never> {
        return passwordSubject.eraseToAnyPublisher()
    }
    
}
