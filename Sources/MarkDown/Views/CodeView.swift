//
//  File.swift
//
//
//  Created by Talaxy on 2021/4/12.
//

import SwiftUI

public struct CodeView: View {
    let element: CodeElement
    
    public init(element: CodeElement) {
        self.element = element
    }
    
    public var body: some View {
        HStack {
            VStack(alignment: .trailing, spacing: 5) {
                ForEach(0..<element.lines.count, id: \.self) { i in
                    AttributedText("\(i + 1)")
                        .foregroundColor(Color.primary.opacity(0.5))
                }
            }
            .padding([.vertical, .leading])
            .padding(.trailing, 7)
            
            ScrollView(.horizontal) {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(element.lines, id: \.self) { line in
                        AttributedText(line)
                            .foregroundColor(Color.primary)
                    }
                }
                .fixedSize()
                .padding(.vertical)
            }
        }
        .overlay(alignment: .topTrailing) {
            langNameView
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .padding(.vertical, 5)
    }
    
    public var langNameView: some View {
        Group {
            if let lang = element.lang {
                Text(lang)
                    .foregroundColor(Color.primary.opacity(0.5))
                    .padding(.vertical, 3)
                    .padding(.horizontal)
            }
        }
    }
}
