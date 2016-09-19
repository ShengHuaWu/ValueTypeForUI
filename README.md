## Protocol and Value Type for UI
Generally speaking, there are three options to build a UI. First, we can choose Auto Layout in Interface Builder. Secondly, we can use Auto Layout in code and maintain references to those constraints. Last, we can implement a layout function with `layoutSubviews`. I personally prefer to write layout manually with `layoutSubviews`, because using Auto Layout in Interface Builder can end up with inconsistencies in the actual UI vs what Interface Builder creates and using Auto Layout in code can be tedious when we need to be able to change the UI at runtime. However, writing layout manually can still be difficult to read and understand later. In 2016 WWDC, there is a session called [protocol and value oriented programming for UIKit apps](https://developer.apple.com/videos/play/wwdc2016/419/), and they introduce a higher level abstraction of writing layout manually with protocol and value type. In this article, I will demonstrate how to use those abstractions to implement the layout, and furthermore how to improve the readability of our code with composition.

Please note that this article adopts Swift 3 and Xcode 8.

### Sample UI
Let's assume that we would like to implement the following UI inside a table view cell.
![cell](https://github.com/ShengHuaWu/ValueTypeForUI/blob/master/Resources/sample-ui.png)
We can consider this UI consists of three layouts. First, there is an inset layout which manages the spacing between each edge of the cell. Secondly, we have a decorating layout which divides the layout into a left section and a right section. Finally, there is a vertical layout which aligns the contents of the right section vertically.

### Implementation
Before implementing those layouts, we should create the Layout protocol at first and write an extension of UIView to conform our Layout protocol.
```
protocol Layout {
    mutating func layout(in rect: CGRect)
}

extension UIView: Layout { ... }
```
Now, we can implement those layouts as Swift structs and make them conform our Layout protocol as well.
```
struct InsetLayout: Layout {
    var content: Layout
    let inset: UIEdgeInsets

    mutating func layout(in rect: CGRect) {
        // Perform layout ...
    }
}

struct DecoratingLayout: Layout {
    var content: Layout
    var decoration: Layout
    let spacing: CGFloat

    mutating func layout(in rect: CGRect) {
        // Perform layout ...
    }
}

struct VerticalLayout: Layout {
    var contents: [Layout]
    let spacing: CGFloat

    mutating func layout(in rect: CGRect) {
        // Perform layout ...
    }
}
```
Finally, we use the composition of those layouts in our custom table view cell's `layoutSubviews` method to achieve our UI without the redundant base views.
```
class DecoratingCell: UITableViewCell {
    private(set) var decoration: UIImageView
    private(set) var title: UILabel
    private(set) var subtitle: UILabel

    ...

    override func layoutSubviews() {
        super.layoutSubviews()

        let verticalLayout = VerticalLayout(contents: [title, subtitle], spacing: 8.0)
        let decoratingLayout = DecoratingLayout(content: verticalLayout, decoration: decoration, spacing: 8.0)
        var composedLayout = InsetLayout(content: decoratingLayout, inset: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0))
        composedLayout.layout(in: contentView.bounds)
    }
}
```
#### Unit Test
Furthermore, we can take the advantages of protocol and value type in Swift to create a mock view and write a unit test for our UI easily.
```
class MockView: Layout {
    private(set) var frame: CGRect

    init() {
        frame = .zero
    }

    func layout(in rect: CGRect) {
        frame = rect
    }
}

class LayoutTests: XCTestCase {
    // MARK: - Enable Tests
    func testLayout() {
        let rect = CGRect(x: 10.0, y: 20.0, width: 100.0, height: 50.0)
        let decoration = MockView()
        let title = MockView()
        let subtitle = MockView()

        let verticalLayout = VerticalLayout(contents: [title, subtitle], spacing: 8.0)
        let decoratingLayout = DecoratingLayout(content: verticalLayout, decoration: decoration, spacing: 8.0)
        var composedLayout = InsetLayout(content: decoratingLayout, inset: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0))
        composedLayout.layout(in: rect)

        XCTAssertEqual(decoration.frame, CGRect(x: 18.0, y: 28.0, width: 34.0, height: 34.0))
        XCTAssertEqual(title.frame, CGRect(x: 60.0, y: 28.0, width: 42.0, height: 13.0))
        XCTAssertEqual(subtitle.frame, CGRect(x: 60.0, y: 49.0, width: 42.0, height: 13.0))
    }
}
```
Here is [the final version of this project in GitHub](https://github.com/ShengHuaWu/ValueTypeForUI).

### Conclusion
Value type in Swift isn't only used to represent models, but also can be used to build our UI. As a result, we create a higher level abstraction of layouts, use composition to implement our UI and increase testability and readability in our codebase. I'm totally open to discussion and feedback, so please share your thoughts.
