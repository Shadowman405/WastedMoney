//
//  PersonListTableViewController.swift
//  WastedMoney
//
//  Created by Maxim Mitin on 4.09.23.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    
    let mockPerson = [Person(name: "Bogdan", lastName: "Bebra", nickName: "Dungeon Master", gender: "Ultramale"), Person(name: "Hoe", lastName: "Honey", nickName: "Twat", gender: "Female")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mockPerson.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = mockPerson[indexPath.row]
        cell.textLabel?.text = "\(person.name) \(person.lastName)  aka - \(person.nickName)"
        return cell
    }
}
