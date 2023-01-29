//
//  File.swift
//  
//
//  Created by Talaxy on 2021/4/11.
//

import SwiftUI

public struct QuoteView<Content: View>: View {
    let element: QuoteElement
    let content: ([Element]) -> Content
    
    public init(
        element: QuoteElement,
        @ViewBuilder content: @escaping ([Element]) -> Content
    ) {
        self.element = element
        self.content = content
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Color.gray.opacity(0.3)
                .frame(width: 5)
            
            VStack(alignment:.leading) {
                content(element.elements)
            }
            .padding(.leading)
            .padding(.top)
            .padding(.bottom, 5)
            
            Spacer(minLength: 0)
        }
        .background(.thickMaterial)
        .padding(.top)
    }
}
