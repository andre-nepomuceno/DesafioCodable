//
//  ViewController.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 15/06/22.
//

import UIKit

class ViewController: UIViewController {

    let viewModel: UserViewModel = UserViewModel()
    
    @IBOutlet weak var usersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getUsersFromAPI()
        usersTableView.dataSource = self
        usersTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDetailsVC = segue.destination as? UserDetailViewController else { return }
        let position = sender as! Int
        let selectedUser = viewModel.getUserBy(position: position)
        let userDetailVM = viewModel.getUserDetailVM(user: selectedUser)
        userDetailsVC.viewModel = userDetailVM
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = self.viewModel.getUserBy(position: indexPath.row)
        let cell = UITableViewCell()
        cell.textLabel?.text = user?.name
        return cell
    }
}
extension ViewController: UserViewModelDelegate {
    func loadUsersSuccess() {
        usersTableView.reloadData()
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userDetailsSegue", sender: indexPath.row)
    }
}
