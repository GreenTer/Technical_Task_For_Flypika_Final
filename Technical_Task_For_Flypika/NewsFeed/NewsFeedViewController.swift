//
//  NewsFeedViewController.swift
//  Technical_Task_For_Flypika
//
//  Created by Baravitski Aliaksandr on 27.06.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedDisplayLogic: class {
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData)
}

class NewsFeedViewController: UIViewController, NewsFeedDisplayLogic {
    
  var interactor: NewsFeedBusinessLogic?
  var router: (NSObjectProtocol & NewsFeedRoutingLogic)?
  
    @IBOutlet weak var table: UITableView!
    
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = NewsFeedInteractor()
    let presenter             = NewsFeedPresenter()
    let router                = NewsFeedRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
//    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    // NewsFeedCell
    table.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: NewsfeedCell.reuseId)
  }
  
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData) {
    switch viewModel {
    case .some:
        print(".some ViewController")
    case .displayNewsFeed:
        print(".displayNewsfeed ViewController")
    }
  }
  
}


extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
//        cell.textLabel?.text = "index: \(indexPath.row)"
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCell.reuseId, for: indexPath) as! NewsfeedCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row")
        interactor?.makeRequest(request: .getFeed)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

}
