//
//  File.swift
//  
//
//  Created by Ian on 18/09/2022.
//

import Foundation

fileprivate let imageType = "image"
fileprivate let imageRegex = #"\[?(!)(\[[^\]\[]*\[?[^\]\[]*\]?[^\]\[]*)\]\(([^\s]+?)(?:\s+(["']))?\)"#
fileprivate let urlSignRegex = #"\(([^\s]+?)(?:\s+(["']))?\)"#
fileprivate let markSignRegex = #"\[?(!)"#

public class ImageSplitRule: SplitRule {
    public override func split(from text: String) -> [Raw] {
        return split(by: imageRegex, text: text, type: imageType)
    }
}

public class ImageMapRule: MapRule {
    public override func map(from raw: Raw, resolver: Resolver?) -> Element? {
        if raw.type == imageType {
            var caption: String = "img"
            var imageURL: URL? = nil
            
            if var urlStr = raw.text.matchResult(by: urlSignRegex).first?.trimmed() {
                urlStr.removeFirst(1) // '('
                urlStr.removeLast(1) // ')'
                imageURL = URL(string: urlStr)
            }
            caption = raw.text.replace(by: markSignRegex, with: "").trimmed()
            return ImageElement(caption: caption, imageURL: imageURL)
        } else {
            return nil
        }
    }
}

public class ImageElement: Element {
    public let caption: String
    public let imageURL: URL?
    
    public init(caption: String, imageURL: URL?) {
        self.caption = caption
        self.imageURL = imageURL
    }
}
