//
//  NewsFeedPresenter.swift
//  Technical_Task_For_Flypika
//
//  Created by Baravitski Aliaksandr on 27.06.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedPresentationLogic {
  func presentData(response: NewsFeed.Model.Response.ResponseType)
}

class NewsFeedPresenter: NewsFeedPresentationLogic {
  weak var viewController: NewsFeedDisplayLogic?
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
  
    switch response {
    case .some:
        print(".some Presenter")
        viewController?.displayData(viewModel: .displayNewsFeed)
    case .responsePresentNewsFeed:
        print(".presentNewsfeed Presenter")
        viewController?.displayData(viewModel: .displayNewsFeed)
    }
  }
  
}
