//
//  AccountView.swift
//  School Application
//
//  Created by Thai Huy on 17/06/2023.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa

protocol TextPublisherProtocol {
    var valuePublisher: AnyPublisher<String?,Never> { get }
}

final class AccountView: UIView {
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Mobile Number/Email"
        label.textColor = ThemeColor.text
        return label
    }()
    
    private lazy var accountTextField: UITextField = {
        var textField = UITextField()
        textField.text = "thaihuy"
        textField.textPublisher
            .assign(to: \.value, on: accountTextFieldSubject)
            .store(in: &cancellables)
        return textField
    }()
    
    private let horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var vStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [
        titleLabel,
        accountTextField,
        horizontalLineView
        ])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private var accountTextFieldSubject = CurrentValueSubject<String?, Never>("thaihuy")
    
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

extension AccountView: TextPublisherProtocol {
    var valuePublisher: AnyPublisher<String?,Never> {
        return accountTextFieldSubject.eraseToAnyPublisher()
    }
}
