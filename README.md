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

## UITableView

Declare conformance.

```swift
class TableViewCell: UITableViewCell, DequeableComponentIdentifiable {}

class TableView: UITableView, DequeableTableView {}
```

Then dequeue by explicity typing a stored property. You may want to use the awesome [require framework](https://github.com/JohnSundell/Require) to lock down your optionals.

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let dequeableTableView: DequeableTableView = (tableView as? DequeableTableView).require(hint: "Must conform to DequeableTableView")
  let cell: TableViewCell = dequeableTableView.dequeue(indexPath)
  return cell
}

```

## UICollectionView

Declare conformance.

```swift
class CollectionViewCell: UICollectionViewCell, DequeableComponentIdentifiable {}

class CollectionView: UICollectionView, DequeableCollectionView {}
```

Then dequeue by explicity typing a stored property. You may want to use the awesome [require framework](https://github.com/JohnSundell/Require) to lock down your optionals.

```swift
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let dequeableCollectionView: DequeableCollectionView = (collectionView as? DequeableCollectionView).require(hint: "Must conform to DequeableCollectionView")
  let cell: CollectionViewCell = dequeableCollectionView.dequeue(indexPath)
  return cell
}

```


## Interface Builder

If you use interface builder then you will need to specify a cell identifier in your interface builder file. The cell identifier should be `"Filename"` + `"ID"`. In the above UITableView example it would be `"TableViewCellID"`. 

It is assumed your interface builder file is in the same bundle. Using the same example above, if we created an interface builder file `TableViewCell.xib`, it would be accompanied in the same bundle as `TableViewCell.swift`.

If you are not using storyboard + prototype cells then register your cells somewhere suitable.

```swift
class TableView: UITableView, DequeableTableView {
    
  override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
    register(cellType: TableViewCell.self, hasNib: false)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}
```


## Installing

### Carthage:

Add `github "rob-nash/Dequable"` to your `Cartfile`.

### Donations.
<p>If you like this and you want to buy me a drink, use bitcoin.</p>

![Bitcoin Image](Resources/Bitcoin.jpg)

Bitcoin Address: 15Gj4DBTzSujnJrfRZ6ivrR9kDnWXNPvNQ
