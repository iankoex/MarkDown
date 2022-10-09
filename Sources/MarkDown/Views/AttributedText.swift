//
//  SwiftUIView.swift
//  
//
//  Created by Ian on 18/09/2022.
//

import SwiftUI

public struct AttributedText: View {
    @Environment(\.markdownHighlightText) var highlightText
    @Environment(\.multilineTextAlignment) var textAlignment
    public var text: String
    
    static let attrOptions = AttributedString.MarkdownParsingOptions(
        allowsExtendedAttributes: true,
        interpretedSyntax: .inlineOnlyPreservingWhitespace,
        failurePolicy: .returnPartiallyParsedIfPossible
    )
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Group {
            if let attributedString = try? AttributedString(markdown: text, options: AttributedText.attrOptions) {
                attributedStringView(attributedString)
            } else {
                Text(text)
            }
        }
        .multilineTextAlignment(textAlignment)
    }
    
    func attributedStringView(_ attributedString: AttributedString) -> some View {
        var attributedString = attributedString
        if !highlightText.isEmpty,
           let range = attributedString.range(of: highlightText, options: .caseInsensitive) {
            attributedString[range].backgroundColor = .orange
        }
        return Text(attributedString)
    }
}
