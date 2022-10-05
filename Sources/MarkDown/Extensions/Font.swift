//
//  File.swift
//  
//
//  Created by Ian on 05/10/2022.
//

import SwiftUI

#if os(macOS)
import AppKit
typealias UnifiedFont = NSFont
#endif

#if os(iOS)
import UIKit
typealias UnifiedFont = UIFont
#endif

extension UnifiedFont {
   static func preferredFont(from font: Font) -> UnifiedFont {
      let style: UnifiedFont.TextStyle
      switch font {
        case .largeTitle:  style = .largeTitle
        case .title:       style = .title1
        case .title2:      style = .title2
        case .title3:      style = .title3
        case .headline:    style = .headline
        case .subheadline: style = .subheadline
        case .callout:     style = .callout
        case .caption:     style = .caption1
        case .caption2:    style = .caption2
        case .footnote:    style = .footnote
        case .body: fallthrough
        default:           style = .body
     }
     return UnifiedFont.preferredFont(forTextStyle: style)
   }
}

