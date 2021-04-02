//
//  LargeBlueFont.swift
//  ViewsAndModifiers
//
//  Created by Ognyanka Boneva on 2.04.21.
//

import SwiftUI

struct LargeBlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeBlueFontStyle() -> some View {
        self.modifier(LargeBlueFont())
    }
}

struct LargeBlueFont_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello word")
            .largeBlueFontStyle()
    }
}
