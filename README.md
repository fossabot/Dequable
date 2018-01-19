<p align="center">
    <img src="Logo.png" width="480" max-width="90%" alt="Dequable" />
</p>

<p align="center">
    <a href="https://travis-ci.org/rob-nash/Dequable">
        <img src="https://travis-ci.org/rob-nash/Dequable.svg?branch=master" alt="Build" />
    </a>
    <a href="https://twitter.com/nashytitz">
        <img src="https://img.shields.io/badge/contact-@nashytitz-blue.svg?style=flat" alt="Twitter: @nashytitz" />
    </a>
</p>

Dequable allows you to write strongly typed let constants for your dequable UI components and limits the need for string based cell identifiers. If you don't use interface builder, then **you will not need to declare any cell identifiers**.

## Usage

The following includes the awesome [require framework](https://github.com/JohnSundell/Require).

Firstly, subclass and declare conformance.

```swift
class TableViewCell: UITableViewCell, DequeableComponentIdentifiable {}

class TableView: UITableView, DequeableTableView {}
```

Then register your cells.

```swift
tableView.register(cellType: TableViewCell.self)
```

Then dequeue to an annotated constant `cell`.

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let dequeableTableView: DequeableTableView = (tableView as? DequeableTableView).require(hint: "Must conform to DequeableTableView")
  let cell: TableViewCell = dequeableTableView.dequeue(indexPath)
  return cell
}
```

And that's it! 🤥 (unless you're using interface builder?)

## Interface Builder

If you are using interface builder with this framework, please ensure the following.

* If you are not using a xib file but you are using a storyboard file + prototype cells, then you *will not* need to register cells.
* The cell identifier in your interface builder file should be `"Classname"` + `"ID"` e.g. `"TableViewCellID"`.
* Your xib filename should match the name of your subclass .e.g `TableViewCell.xib`.
* Your xib file `TableViewCell.xib` should be in the same bundle as your code `TableViewCell.swift`.
* If you are using a xib, you must register your cells with `hasXib: true`.

```swift
register(cellType: TableViewCell.self, hasXib: true)
```

Dequeuing UICollectionViewCell's or supplementary views, is very similar to the above.

## Installing

### Carthage:

Add `github "rob-nash/Dequable"` to your `Cartfile`.

### Donations.
<p>If you like this and you want to buy me a drink, use bitcoin.</p>

![Bitcoin Image](Resources/Bitcoin.jpg)

Bitcoin Address: 15Gj4DBTzSujnJrfRZ6ivrR9kDnWXNPvNQ
