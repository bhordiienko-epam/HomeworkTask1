//
//  ListViewModel.swift
//  HomeworkTask1
//
//  Created by Bohdan on 06.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import Foundation

class ListViewModel: ListViewModelProtocol {
    var networkingManager: NetworkingManagerProtocol
    weak var view: ListTableViewProtocol?
    var listModel: ListModel?
    
    var numberOfCells: Int {
        return listModel?.strings.count ?? 0
    }
    
    init(networkingManager: NetworkingManagerProtocol) {
        self.networkingManager = networkingManager
    }
    
    func onViewDidLoaded(view: ListTableViewProtocol?) {
        self.view = view
        loadList()
    }
    
    func item(at index: Int) -> String? {
        guard let model = listModel else { return nil }
        
        return model[index]
    }
    
    private func loadList() {
        let urlBuilder = URLBuilder()
        let url = urlBuilder.getListUrl()
        
        networkingManager.loadList(url: url) {[ weak self ] response, error in
            guard let model = response else { return }
            
            self?.listModel = model
            self?.view?.refreshView()
        }
    }
}


