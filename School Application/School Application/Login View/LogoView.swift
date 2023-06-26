//
//  LogoView.swift
//  School Application
//
//  Created by Thai Huy on 17/06/2023.
//

import UIKit
import SnapKit

final class LogoView: UIView {
    private var hiLabel: UILabel = {
        var label = UILabel()
        label.text = "Hi Student"
        label.textColor = ThemeColor.primary
        return label
    }()
    
    private var signInLabel: UILabel = {
        var label = UILabel()
        label.text = "Sign in to continue"
        label.textColor = ThemeColor.primary
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [
        hiLabel,
        signInLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
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
            make.leadingMargin.equalToSuperview()
        }
    }
}
