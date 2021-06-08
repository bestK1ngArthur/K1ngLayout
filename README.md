# Layout
![Language](https://img.shields.io/static/v1?label=language&message=swift&color=orange)

📐 Simple autolayout wrapper

## Instalation

### CocoaPods

Add pod to Podfile

```
pod 'Layout', :git => 'https://github.com/bestK1ngArthur/K1ngLayout'
```

### Swift Package Manager

Add package to dependencies

```
.package(url: "https://github.com/bestK1ngArthur/K1ngLayout", from: "0.0.1"),
```

## Examples

```Swift

// With autolayout

let constraints = [
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 8),
    view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16)
]

NSLayoutConstraint.activate(constraints)

// With Layout

let constraints = [
    view.top.equal(to: superview.top, constant: 8),
    view.left.equal(to: superview.left, constant: 16)
]

view.activate(constraints)

```

```Swift

// With autolayout

let constraints = [
    view.topAnchor.constraint(equalTo: superview.topAnchor),
    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
    view.leftAnchor.constraint(equalTo: superview.leftAnchor),
    view.rightAnchor.constraint(equalTo: superview.rightAnchor)
]

NSLayoutConstraint.activate(constraints)

// With Layout

view.activate(
    view.pinEqualEdges(to: superview)
)

```

```Swift

// With autolayout

let constraints = [
    view.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 16),
    view.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -16)
]

NSLayoutConstraint.activate(constraints)

// With Layout

view.activate(
    view.pinEqualEdges(to: superview, insets: .horizontal(16))
)

```
