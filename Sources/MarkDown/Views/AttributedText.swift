//
//  SwiftUIView.swift
//  
//
//  Created by Ian on 18/09/2022.
//

import SwiftUI

public struct AttributedText: View {
    public var text: String
    public var fontWeight: Font.Weight
    
    public init(
        _ text: String,
        fontWeight: Font.Weight = .regular
    ) {
        self.text = text
        self.fontWeight = fontWeight
    }
    
    public var body: some View {
        Group {
            if let attributedString = try? AttributedString(markdown: text) {
                Text(attributedString)
                    .fontWeight(fontWeight)
            } else {
                Text(text)
                    .fontWeight(fontWeight)
            }
        }
    }
}
