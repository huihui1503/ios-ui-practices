//
//  NotificationViewModel.swift
//  School Application
//
//  Created by Thai Huy on 18/06/2023.
//

import Combine

class UserDetailViewModel {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
}

final class LoginViewModel {
    
    struct Input {
        let signInPublisher: AnyPublisher<Bool, Never>
        let accountPublisher: AnyPublisher<String?, Never>
        let passwordPublisher: AnyPublisher<String?, Never>
    }
    
    struct Output {
        let signInResult: AnyPublisher<DetailedInformationUser, Never>
    }
    
    private var existedUsers = ExistedUsers()
    
    private var usersDatabase = UserDatabase()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func transform(input: Input) -> Output {
        
        let signInSubject = PassthroughSubject<DetailedInformationUser, Never>()
        
        Publishers.CombineLatest3(
            input.signInPublisher,
            input.accountPublisher,
            input.passwordPublisher
        )
        .sink { [weak self] isTapped, account, password in
            
            guard isTapped,
            let account = account,
            let password = password else {
                return
            }
            
            let user = User(account: account, password: password)
            
            guard let isAccountAccept = self?.existedUsers.doesContainUser(user: user) else {
                return
            }
            
            guard let detailUser = self?.usersDatabase.doesContainUser(user: user) else {
                return
            }
            
            signInSubject.send(detailUser)
        }.store(in: &subscriptions)
        
        let output = Output(signInResult: signInSubject.eraseToAnyPublisher())
        return output
    }
}
