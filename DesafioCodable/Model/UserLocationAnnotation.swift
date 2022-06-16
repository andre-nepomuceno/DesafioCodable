//
//  UserLocationAnnotation.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 16/06/22.
//

import Foundation
import MapKit

class UserLocationAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    var coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        locationName: String?,
        coordinate: CLLocationCoordinate2D
      ) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate

        super.init()
      }
    
    var subtitle: String? {
      return locationName
    }
}
