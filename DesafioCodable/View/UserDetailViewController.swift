//
//  UserDetailViewController.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 16/06/22.
//

import UIKit
import MapKit

class UserDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userLocationMapView: MKMapView!
    
    //MARK: - Public properties
    var viewModel: UserDetailViewModel?
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        userLocationMapView.centerToLocation(initialLocation)
        viewModel?.delegate = self
        viewModel?.loadVC()
    }

}
//MARK: - Delegate Extensions
extension UserDetailViewController: UserDetailViewModelDelegate {
    func loadFieldsData(user: User) {
        self.nameLabel.text = user.name
        self.userNameLabel.text = user.username
        self.emailLabel.text = user.email
        self.phoneLabel.text = user.phone
        self.streetLabel.text = user.address.street
        self.suiteLabel.text = user.address.suite
        self.cityLabel.text = user.address.city
        self.zipCodeLabel.text = user.address.zipcode
        self.companyNameLabel.text = user.company.name
    }

    func setMapLocation(latitude: Double, longitude: Double, title: String, locationName: String) {
        let coordinate: CLLocationCoordinate2D = .init(latitude: latitude, longitude: longitude)
        let userLocation = UserLocationAnnotation(
          title: "",
          locationName: "",
          coordinate: coordinate)
                
        let span = MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60)
        let region = MKCoordinateRegion(center: coordinate, span: span)

        self.userLocationMapView.addAnnotation(userLocation)
        self.userLocationMapView.setRegion(region, animated: true)
    }
}

private extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: regionRadius,
        longitudinalMeters: regionRadius
    )
    setRegion(coordinateRegion, animated: true)
  }
}
