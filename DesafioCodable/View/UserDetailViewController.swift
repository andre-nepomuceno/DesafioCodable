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
        setGradientBackground()
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        userLocationMapView.centerToLocation(initialLocation)
        viewModel?.delegate = self
        viewModel?.loadVC()
    }
    
    //MARK: - Private methods
    private func setGradientBackground() {
        let colorTop =  UIColor(red: 240.0/255.0, green: 130.0/255.0, blue: 50.0/255.0, alpha: 0.70).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 0.05).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 0.20]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
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
