import UIKit
import Dequable

class TableViewCell: UITableViewCell, DequeableComponentIdentifiable {}

class TableView: UITableView, DequeableTableView {}

class ViewController: UIViewController {

  private let tableView = TableView()
  
  override func loadView() {
    let view = UIView()
    view.addSubview(tableView)
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.register(cellType: TableViewCell.self)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
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
