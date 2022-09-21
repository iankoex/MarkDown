//
//  Header.swift
//  
//
//  Created by Talaxy on 2021/4/11.
//

import SwiftUI

public struct HeaderView: View {
    let element: HeaderElement
    @ScaledMetric(relativeTo: .body) var scaledFontSize: CGFloat = 31
    
    public init(element: HeaderElement) {
        self.element = element
    }
    
    public var font: Font {
        let elementSize = 2 * element.level
        let fontSize = scaledFontSize - CGFloat(elementSize)
        return .system(size: fontSize)
    }
    
    public var body: some View {
        if let attributedString = try? AttributedString(markdown: element.title) {
            Text(attributedString)
                .bold()
                .font(font)
                .padding(.vertical, 3)
        } else {
            Text(element.title)
                .bold()
                .font(font)
                .padding(.vertical, 3)
        }
    }
}
