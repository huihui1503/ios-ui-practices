//
//  UserInformationView.swift
//  School Application
//
//  Created by Huy Thai on 26/06/2023.
//

import UIKit
import SnapKit

final class UserInformationView: UIView {
    
    private var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full name: Thai Hoang Huy"
        label.textColor = ThemeColor.text
        return label
    }()
    
    private var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age: 20"
        label.textColor = ThemeColor.text
        return label
    }()
    
    private var dobLabel: UILabel = {
        let label = UILabel()
        label.text = "DOB: 15/03/2000"
        label.textColor = ThemeColor.text
        return label
    }()
    
    private var majorLabel: UILabel = {
        let label = UILabel()
        label.text = "Major: Computer Science"
        label.textColor = ThemeColor.text
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        fullNameLabel,
        ageLabel,
        dobLabel,
        majorLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    public func updateUI(user: DetailedInformationUser) {
        fullNameLabel.text = "Full name: \(user.fullName)"
        ageLabel.text = "Age: \(user.age)"
        dobLabel.text = "DOB: \(user.dob)"
        majorLabel.text = "Major: \(user.major)"
    }
}
