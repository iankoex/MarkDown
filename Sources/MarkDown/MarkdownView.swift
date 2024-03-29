//
//  File.swift
//  
//
//  Created by Talaxy on 2021/4/11.
//

import SwiftUI

public let defaultSplitRules: [SplitRule] = [
    SpaceConvertRule(priority: 0),
//    FrontMatterSplitRule(priority: 1),
    BorderSplitRule(priority: 2),
    ListSplitRule(priority: 3),
    TableSplitRule(priority: 4),
    CodeBlockSplitRule(priority: 5),
    CodeIndentSplitRule(priority: 6),
    HeaderSplitRule(priority: 7),
    QuoteSplitRule(priority: 8),
    ImageSplitRule(priority: 9),
    LineSplitRule(priority: 10)
]

public let defaultMapRules: [MapRule] = [
//    FrontMatterMapRule(priority: 0),
    HeaderMapRule(priority: 1),
    QuoteMapRule(priority: 2),
    CodeMapRule(priority: 3),
    ListMapRule(priority: 4),
    TableMapRule(priority: 5),
    BorderMapRule(priority: 6),
    ImageMapRule(priority: 7),
    LineMapRule(priority: 8)
]

public struct MarkdownView<Content: View>: View {
    @Binding private var text: String
    @State private var elements: [Element] = []
    @State private var hasResolved: Bool = false
    var resolver = Resolver()
    public let content: (Element) -> Content
    
    public init(
        _ text: String,
        @ViewBuilder content: @escaping (Element) -> Content
    ) {
        self._text = .constant(text)
        self.content = content
    }
    
    public init(
        _ text: Binding<String>,
        @ViewBuilder content: @escaping (Element) -> Content
    ) {
        self._text = text
        self.content = content
    }
    
    public init(
        elements: [Element],
        @ViewBuilder content: @escaping (Element) -> Content
    ) {
        self._text = .constant("")
        self.elements = elements
        self.content = content
    }
    
    public init(
        text: String,
        resolver: Resolver = Resolver(),
        @ViewBuilder content: @escaping (Element) -> Content
    ) {
        self._text = .constant(text)
        self.resolver = resolver
        self.content = content
    }
    
    public init(
        text: Binding<String>,
        splitRules: [SplitRule]? = defaultSplitRules,
        mapRules: [MapRule]? = defaultMapRules,
        @ViewBuilder content: @escaping (Element) -> Content
    ) {
        let resolver = Resolver(
            splitRules: splitRules ?? defaultSplitRules,
            mapRules: mapRules ?? defaultMapRules
        )
        self._text = text
        self.resolver = resolver
        self.content = content
    }
    
    public var body: some View {
        Group {
            if elements.isEmpty {
                AttributedText(text)
            } else {
                ForEach(elements) { element in
                    HStack(spacing: 0) {
                        content(element)
                        Spacer(minLength: 0)
                    }
                }
            }
        }
        .onAppear {
            renderElements()
        }
        .onChange(of: text) { _ in
            hasResolved = false
            renderElements()
        }
    }
    
    private func renderElements() {
        guard !text.isEmpty else {
            return
        }
        guard hasResolved == false else {
            return
        }
        Task.detached {
            let elements = resolver.render(text: text)
            DispatchQueue.main.async {
                self.elements = elements
                hasResolved = true
            }
        }
    }
}

public struct ElementView: View {
    public let element: Element
    
    public init(element: Element) {
        self.element = element
    }
    
    public var body: some View {
        switch element {
            case let header as HeaderElement:
                HeaderView(element: header)
            case let quote as QuoteElement:
                QuoteView(element: quote) { item in
                    MarkdownView(elements: item) { element in
                        ElementView(element: element)
                    }
                }
            case let code as CodeElement:
                CodeView(element: code)
            case let orderList as OrderListElement:
                OrderList(element: orderList) { item in
                    MarkdownView(elements: item) { element in
                        ElementView(element: element)
                    }
                }
            case let unorderList as UnorderListElement:
                UnorderList(element: unorderList) { item in
                    MarkdownView(elements: item) { element in
                        ElementView(element: element)
                    }
                }
            case let table as TableElement:
                TableView(element: table)
            case _ as BorderElement:
                BorderView()
            case let imageElement as ImageElement:
                ImageView(element: imageElement)
            case let line as LineElement:
                LineView(element: line)
            default:
                EmptyView()
        }
    }
}
