//
//  DetailViewController.swift
//  DequableDemo
//
//  Created by Robert Nash on 19/10/2017.
//  Copyright © 2017 Robert Nash. All rights reserved.
//

import UIKit
import Dequable

class DetailTableViewCell: UITableViewCell, DequeableComponentIdentifiable {}

class DetailTableView: UITableView, DequeableTableView {
  
  func register(hasNib: Bool) {
    register(cellType: DetailTableViewCell.self, hasNib: hasNib)
  }
  
}

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  private let tableView = DetailTableView()
  
  var hasNib = false
  
  override func loadView() {
    let view = UIView()
    view.addSubview(tableView)
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(hasNib: hasNib)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: DetailTableViewCell = (tableView as! DequeableTableView).dequeue(indexPath)
    cell.textLabel?.text = "Row \(indexPath.row + 1)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = DetailViewController()
    controller.hasNib = true
    navigationController?.pushViewController(controller, animated: true)
  }
  
}
