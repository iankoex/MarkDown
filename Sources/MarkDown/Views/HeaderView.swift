//
//  Header.swift
//  
//
//  Created by Talaxy on 2021/4/11.
//

import SwiftUI

public struct HeaderView: View {
    @Environment(\.font) var font
    let element: HeaderElement
    
    public init(element: HeaderElement) {
        self.element = element
    }
    
    public var internalFont: Font {
        let elementSize = element.level
        let nsFont: UnifiedFont = UnifiedFont.preferredFont(from: font ?? .body)
        return .system(size: nsFont.pointSize + (nsFont.pointSize / CGFloat(elementSize)))
    }
    
    public var body: some View {
        AttributedText(element.title)
            .font(internalFont.weight(.bold))
            .foregroundColor(element.level == 6 ? .gray : .primary)
            .padding(.vertical, 3)
    }
}
