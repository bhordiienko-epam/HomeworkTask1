//
//  MockNetworkingManager.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 09.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
@testable import HomeworkTask1

class MockNetworkingManager: NetworkingManager {
    var responseString = String()
    
    convenience init(responseString: String) {
        self.init()
        self.responseString = responseString
    }
    
    override func load(url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        let data = Data(responseString.utf8)
        completionHandler(data, nil)
    }
}
