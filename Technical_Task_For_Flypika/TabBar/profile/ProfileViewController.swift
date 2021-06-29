//
//  ProfileViewController.swift
//  Technical_Task_For_Flypika
//
//  Created by Baravitski Aliaksandr on 25.06.21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let profileInfo = ["Друзья", "Подписки", "Сообщества", "Музыка", "Видео"] 

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell
        cell.profileInfoText.text = profileInfo[indexPath.row]
                
        return cell
    }
}
