//
//  ListViewModelTests.swift
//  HomeworkTask1Tests
//
//  Created by Bohdan on 08.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation
import XCTest
@testable import HomeworkTask1

class ListViewModelTests: XCTestCase {
    var listViewModel: ListViewModel!
    var listView: MockListView!
    var networkingManager: NetworkingManagerProtocol!
    
    private let expectedModel = [ "qwerty", "asdfgh", "zxcvbn"]
    
    private var response: String {
        let str = expectedModel.map{ String($0) }
                               .joined(separator: "\n")
        return str
    }
    
    private var expectedNumberOfCells: Int {
        return expectedModel.count
    }
    
    override func setUp() {
        super.setUp()
        
        networkingManager = MockNetworkingManager.init(responseString: response)
        listView = MockListView()
        listViewModel = ListViewModel(networkingManager: networkingManager)
        listViewModel.onViewDidLoaded(view: listView)
        
        let expectation = self.expectation(description: "loading")
        let urlBuilder = URLBuilder()
        
        networkingManager.loadList(url: urlBuilder.getListUrl()) { _, _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    
    override func tearDown() {}
    
    func testOnViewDidLoad() {
        XCTAssertNotNil(listViewModel.view)
    }
    
    func testModelLoading() {
        XCTAssertNotNil(listViewModel.listModel)
        
        guard let model = listViewModel.listModel else {
            XCTFail()
            return
        }
 
        XCTAssertTrue(model.strings.isEqual(with: expectedModel))
    }
    
    func testViewWasUpdated() {
        guard let view = listViewModel.view as? MockListView else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(view.isViewRefresged)
    }
    
    func testNumberOfCells() {
        XCTAssertEqual(expectedNumberOfCells, listViewModel.numberOfCells)
    }
    
    func testItemsForCells() {
        guard let strings = listViewModel.listModel?.strings else {
            XCTFail()
            return
        }
        
        for (index, item) in strings.enumerated() {
            XCTAssertEqual(expectedModel[index], item)
        }
    }
}

fileprivate extension Array where Element == String {
    func isEqual(with array: [String]) -> Bool {
        let first = Set(self)
        let second = Set(array)
        
        return first == second
    }
}
