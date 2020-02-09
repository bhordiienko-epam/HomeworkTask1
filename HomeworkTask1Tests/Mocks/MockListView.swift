//
//  MockListView.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
@testable import HomeworkTask1

class MockListView: ListTableViewProtocol {
    var isViewRefresged: Bool = false
    
    func refreshView() {
        isViewRefresged = true
    }
}
