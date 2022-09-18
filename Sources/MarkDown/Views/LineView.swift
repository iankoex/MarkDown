//
//  File.swift
//  
//
//  Created by Talaxy on 2021/4/12.
//

import SwiftUI

public struct LineView: View {
    let element: LineElement
    
    public init(element: LineElement) {
        self.element = element
    }
    
    public var body: some View {
        AttributedText(element.text)
    }
}
