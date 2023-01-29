# MarkDown

Adapted from of Talaxy's [RoomTime](https://github.com/RainbowTalaxy/RoomTime.git)

# Requirements

- iOS 15 or newer
- macOS 12 or newer
- tvOS 14 or newer (not tested)
- watchOS 7 or newer (not tested)

# Installation

Use Swift Package Manager

# Usage

Here is a brief usage:

```swift
import Markdown

struct MarkdownDemo: View {
    let text: String
    
    var body: some View {
        ScrollView {
            MarkdownView(text: text) { element in
                ElementView(element: element)
            }
            .padding(.horizontal)
        }
    }
}

```

### Syntax support

* header 1-6
* quote
* order or unorder list
* indent or block code
* border
* table
* images

## Test
This text shows the capabilities of Markdown

    # Heading 1
    ## Heading 2
    ### Heading 3
    #### Heading 4
    ##### Heading 5
    ###### Heading 6

    **Bold**

    ``italics``

    ~~Strike~~

    # List

    Unorder list
        - apple
        + banana
        * strawberry

    Order list
        1. eat
        2. code!
        3. sleep

    You can also specify the offset:

        11. eat
        2. code!
        3. sleep

    # Quote

    > An apple a day keeps the doctor away.

    > An apple a day keeps the doctor away.
    >> Quote can also be nested.
    > > > and spaces are allowed between arrows.

    # Code

    Supports indent code:
        var name = "Talaxy"
    and code block syntax:

    ```swift
    // example
    struct Demo: View {
        var body: some View {
            Text("Hello world!")
        }
    }
    ```

    # Border

    ---
    * * *
    __ ___ ____

    Alignment syntax is supported.

    | Property | Type   | Description            |
    |:-------- |:------:| ----------------------:|
    | title    | String | The title of the news. |
    | date     | Date   | The date of the news.  |
    | author   | String | The author ...         |

    [ Apple](https://www.apple.com)

    ![Image From picsum](https://picsum.photos/id/223/100/150)

    # SwiftUI

    Declare the user interface and behavior for your app on every platform.

    ---

    ## Overview

    SwiftUI provides views, controls, and layout structures
    for declaring your app’s user interface.

    ---

    ― From Apple Developer Documentation


