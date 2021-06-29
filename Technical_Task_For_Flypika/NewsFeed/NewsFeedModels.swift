//
//  NewsFeedModels.swift
//  Technical_Task_For_Flypika
//
//  Created by Baravitski Aliaksandr on 27.06.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getFeed
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case responsePresentNewsFeed
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayNewsFeed
      }
    }
  }
  
}
