//
//  NeuOuterShadowViewModifier.swift
//  Neu
//
//  Created by Alex Nagy on 08.09.2021.
//

import SwiftUI

public struct NeuOuterShadowViewModifier: ViewModifier {
    private var lightShadowColor : Color
    private var darkShadowColor : Color
    private var offset: CGFloat
    private var radius : CGFloat
    
    public init(darkShadowColor: Color = .neuDarkShadow,
                lightShadowColor: Color = .neuLightShadow,
                offset: CGFloat = 6,
                radius: CGFloat = 3) {
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        self.offset = offset
        self.radius = radius
    }

    public func body(content: Content) -> some View {
        content
        .shadow(color: darkShadowColor, radius: radius, x: offset, y: offset)
        .shadow(color: lightShadowColor, radius: radius, x: -offset, y: -offset)
    }

}
