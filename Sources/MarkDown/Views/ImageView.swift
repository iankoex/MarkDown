//
//  SwiftUIView.swift
//  
//
//  Created by Ian on 18/09/2022.
//

import SwiftUI

public struct ImageView: View {
    let element: ImageElement
    
    public init(element: ImageElement) {
        self.element = element
    }
    
    public var body: some View {
        VStack {
            AsyncImage(url: element.imageURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300) // Sacrifices had to be made
                } else if phase.error != nil {
                    errorView
                } else {
                    placeholderView
                }
            }
            captionView
        }
    }
    
    public var errorView: some View {
        Image(systemName: "exclamationmark.triangle")
            .symbolRenderingMode(.hierarchical)
            .font(.largeTitle)
            .foregroundColor(.yellow)
    }
    
    public var placeholderView: some View {
        ProgressView()
            .progressViewStyle(.circular)
        #if os(macOS)
            .scaleEffect(0.5)
        #endif
    }
    
    public var captionView: some View {
        AttributedText(element.caption)
    }
}
