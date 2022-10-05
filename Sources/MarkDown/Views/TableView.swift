//
//  File.swift
//  
//
//  Created by Talaxy on 2021/5/2.
//

import SwiftUI

public struct TableView: View {
    @Environment(\.font) var font
    public let element: TableElement
    
    public init(element: TableElement) {
        self.element = element
    }
    
    public var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<element.heads.count, id: \.self) { col in
                    // single column
                    Divider()
                    VStack(alignment: mapAlign(align: element.aligns[col]), spacing: 0) {
                        Divider()
                        AttributedText(element.heads[col])
                            .font(font?.weight(.bold))
                            .padding(8)
                        Divider()
                        ForEach(0..<element.rows.count, id: \.self) { row in
                            Divider()
                            
                            AttributedText(element.rows[row][col])
                                .padding(8)
                        }
                        Divider()
                    }
                    Group {
                        if Int(col) == (element.heads.count - 1) {
                            Divider()
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    func mapAlign(align: TableElement.Alignment) -> HorizontalAlignment {
        switch align {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
