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
<a href="https://app.fossa.io/projects/git%2Bgithub.com%2Frob-nash%2FDequable?ref=badge_shield" alt="FOSSA Status"><img src="https://app.fossa.io/api/projects/git%2Bgithub.com%2Frob-nash%2FDequable.svg?type=shield"/></a>
    <a href="https://codebeat.co/projects/github-com-rob-nash-dequable-master">
      <img alt="codebeat badge" src="https://codebeat.co/badges/e5078705-a2be-443b-b60f-1b61b2565758" />
    </a>
    <a href="https://twitter.com/nashytitz">
        <img src="https://img.shields.io/badge/contact-@nashytitz-blue.svg?style=flat" alt="Twitter: @nashytitz" />
    </a>
</p>

## Usage

Say goodbye to reuse identifiers.

```swift
class TableViewCell: UITableViewCell, DequeableComponentIdentifiable {}

class TableView: UITableView, DequeableTableView {}

tableView.register(cellType: TableViewCell.self)

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let tableView = tableView as! DequeableTableView
  let cell: TableViewCell = tableView.dequeue(indexPath)
  return cell
}
```

## Interface Builder

If you are using interface builder then you will need to specify a reuse identifier in your storyboard or xib file. The cell identifier should be `"Classname"` + `"ID"` e.g. `"TableViewCellID".`

If you're using a xib, you will need to mention that during registration.

```swift
register(cellType: TableViewCell.self, hasXib: true)
```

## Installing

For the latest release, select the [Releases](https://github.com/rob-nash/Dequable/releases) tab.

### Carthage:

Add `github "rob-nash/Dequable"` to your `Cartfile`.
