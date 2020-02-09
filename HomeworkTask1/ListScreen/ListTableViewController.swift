//
//  ListTableViewController.swift
//  HomeworkTask1
//
//  Created by Bohdan on 05.12.2019.
//  Copyright © 2019 HorBog. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var viewModel: ListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "listItemCell")
        tableView.tableFooterView = UIView(frame: .zero)
        
        viewModel.onViewDidLoaded(view: self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItemCell", for: indexPath)
        
        cell.textLabel?.text = viewModel.item(at: indexPath.row)

        return cell
    }
}

extension ListTableViewController: ListTableViewProtocol {
    func refreshView() {
        tableView.reloadData()
    }
}
