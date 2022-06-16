//
//  UserViewModel.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 15/06/22.
//

import Foundation

protocol UserViewModelDelegate {
    func loadUsersSuccess()
}

class UserViewModel {
    
    //MARK: - Public Properties
    
    var delegate: UserViewModelDelegate?
    
    //MARK: - Private Properties
    
    private let service: Service = .init()
    private var users: [User] = []
    
    //MARK: - Public Methods
    
    func getUsersFromAPI() {
        service.loadUsers { users in
            DispatchQueue.main.async {
                self.users = users
                self.delegate?.loadUsersSuccess()
            }            
        }
    }
    
    func getUsersCount() -> Int {
        return self.users.count
    }
    
    func getUserBy(position: Int) -> User? {
        return users[position]
    }
    
    func getUserDetailVM(user: User?) -> UserDetailViewModel? {
        guard let user = user else { return nil }
        return UserDetailViewModel(user)
    }
    
}
