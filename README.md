<p align="center">
    <img src="Logo.png" width="480" max-width="90%" alt="Dequable" />
</p>

<p align="center">
    <a href="https://travis-ci.org/rob-nash/Dequable">
        <img src="https://travis-ci.org/rob-nash/Dequable.svg?branch=master" alt="Build" />
    </a>
    <a href="https://img.shields.io/badge/carthage-compatible-brightgreen.svg">
        <img src="https://img.shields.io/badge/carthage-compatible-brightgreen.svg" alt="Carthage"/>
    </a>
    <a href="https://codebeat.co/projects/github-com-rob-nash-dequable-master">
      <img alt="codebeat badge" src="https://codebeat.co/badges/e5078705-a2be-443b-b60f-1b61b2565758" />
    </a>
    <a href="https://twitter.com/nashytitz">
        <img src="https://img.shields.io/badge/contact-@nashytitz-blue.svg?style=flat" alt="Twitter: @nashytitz" />
    </a>
</p>

Dequable limits the need for reuse identifiers.

## Usage

Step 1

```swift
class TableViewCell: UITableViewCell, DequeableComponentIdentifiable {}

class TableView: UITableView, DequeableTableView {}
```

Step 2

```swift
tableView.register(cellType: TableViewCell.self)
```

Step 3

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let tableView = tableView as! DequeableTableView
  let cell: TableViewCell = tableView.dequeue(indexPath)
  return cell
}
```

**No reuse identifiers needed!**

## Interface Builder

* The cell identifier in your interface builder file should be `"Classname"` + `"ID"` e.g. `"TableViewCellID"`.
* Your xib filename should match the name of your subclass .e.g `TableViewCell.xib`.
* Your xib file `TableViewCell.xib` should be in the same bundle as your code `TableViewCell.swift`.
* If you are using a storyboard file + prototype cells, then you *will not* need to register cells.
* If you are using a xib, you must register your cells.

```swift
register(cellType: TableViewCell.self, hasXib: true)
```

Dequeuing UICollectionViewCell's or supplementary views, is very similar to the above.

## Installing

For the latest release, select the [Releases](https://github.com/rob-nash/Dequable/releases) tab.

### Carthage:

Add `github "rob-nash/Dequable"` to your `Cartfile`.
