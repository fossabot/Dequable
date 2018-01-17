//
//  ViewController.swift
//  DequableDemo
//
//  Created by Robert Nash on 19/10/2017.
//  Copyright © 2017 Robert Nash. All rights reserved.
//

import UIKit
import Dequable

class TableViewCell: UITableViewCell, DequeableComponentIdentifiable {
    
}

class TableView: UITableView, DequeableTableView {
    
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: TableView! {
        didSet {
          tableView.dataSource = self
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dequableTableView = tableView as? DequeableTableView else {
            fatalError("Must conform to DequeableTableView")
        }
        let cell: TableViewCell = dequableTableView.dequeue(indexPath)
        cell.textLabel?.text = "Row \(indexPath.row + 1)"
        return cell
    }
}
