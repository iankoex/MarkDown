//
//  File.swift
//  
//
//  Created by Ian on 05/10/2022.
//

import SwiftUI

struct HighlightTextKey: EnvironmentKey {
    static var defaultValue: String = ""
}

extension EnvironmentValues {
    var markdownHighlightText: String {
        get { self[HighlightTextKey.self] }
        set { self[HighlightTextKey.self] = newValue }
    }
}
