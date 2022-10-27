//
//  File.swift
//  
//
//  Created by Ian on 05/10/2022.
//

import SwiftUI

public struct HighlightTextKey: EnvironmentKey {
    public static var defaultValue: String = ""
}

public extension EnvironmentValues {
    var markdownHighlightText: String {
        get { self[HighlightTextKey.self] }
        set { self[HighlightTextKey.self] = newValue }
    }
}
