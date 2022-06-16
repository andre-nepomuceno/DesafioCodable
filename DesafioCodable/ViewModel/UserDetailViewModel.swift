//
//  UserDetailViewModel.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 16/06/22.
//

import Foundation

protocol UserDetailViewModelDelegate {
    func loadFieldsData(user: User)
    func setMapLocation(latitude: Double, longitude: Double, title: String, locationName: String)
}

class UserDetailViewModel {
    
    var delegate: UserDetailViewModelDelegate?
    private let user: User
    
    init(_ user: User) {
        self.user = user
    }
    
    func loadVC() {
        guard let latitude = Double(user.address.geo.lat) else { return }
        guard let longitude = Double(user.address.geo.lng) else { return }
        
        delegate?.loadFieldsData(user: user)
        delegate?.setMapLocation(latitude: latitude, longitude: longitude, title: self.user.name, locationName: "\(self.user.address.street), \(self.user.address.suite)")
    }
    
    func getUserLatitude() -> Double {
        if let latitude = Double(self.user.address.geo.lat) {
            return latitude
        }
        return 0.0
    }
    func getUserLongitude() -> Double {
        if let longitude = Double(self.user.address.geo.lng) {
            return longitude
        }
        return 0.0
    }
}

