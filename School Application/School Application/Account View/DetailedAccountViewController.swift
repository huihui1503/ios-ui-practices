//
//  DetailedAccountViewController.swift
//  School Application
//
//  Created by Thai Huy on 19/06/2023.
//

import UIKit
import SnapKit
import Combine

final class DetailedAccountViewController: UIViewController {
    
    private var viewModel: DetailedAccountViewModel
    
    private let userInformationView = UserInformationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeColor.bg
    }
    
    init(user: DetailedInformationUser) {
        self.viewModel = DetailedAccountViewModel(detailedInformation: user)
        super.init(nibName: nil, bundle: nil)
        self.layout()
        self.userInformationView.updateUI(user: self.viewModel.detailedInformation)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        view.addSubview(userInformationView)
        
        userInformationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.trailing.leading.equalToSuperview()
        }
    }
}
