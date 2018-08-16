import UIKit
import Dequable

final class TableViewCell: UITableViewCell, DequeableComponentIdentifiable {}

final class TableView: UITableView, DequeableTableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        register(cellType: TableViewCell.self)
        register(headerFooterViewType: SectionHeaderView.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class SectionHeaderView: UITableViewHeaderFooterView, DequeableComponentIdentifiable {
    
    let label: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        place(subview: label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {

  private let tableView = TableView()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.place(subview: tableView)
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension ViewController: UITableViewDataSource {
    
  func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
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

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tableView = tableView as? DequeableTableView else {
            fatalError("Must conform to DequeableTableView")
        }
        let view: SectionHeaderView = tableView.dequeue()
        view.label.text = "Section \(section + 1)"
        return view
    }
}

private extension UIView {
    func place<T: UIView>(subview: T) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
}
