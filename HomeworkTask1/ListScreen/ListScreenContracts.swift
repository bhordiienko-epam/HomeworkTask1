//
//  ListScreenContracts.swift
//  HomeworkTask1
//
//  Created by Bohdan on 06.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation

protocol ListViewModelProtocol {
    var view: ListTableViewProtocol? { get set }
    var numberOfCells: Int { get }
    
    func onViewDidLoaded(view: ListTableViewProtocol?)
    func item(at index: Int) -> String?
}

protocol ListTableViewProtocol: AnyObject {
    func refreshView()
}
