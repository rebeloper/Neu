//
//  NeuInnerShadowViewModifier.swift
//  Neu
//
//  Created by Alex Nagy on 08.09.2021.
//

import SwiftUI

public struct NeuInnerShadowViewModifier<S: Shape> : ViewModifier {
    private var shape: S
    private var darkShadowColor: Color
    private var lightShadowColor: Color
    private var spread: CGFloat // The value of spread is between 0 to 1. Higher value makes the shadow look more intense.
    private var radius: CGFloat
    
    public init(shape: S,
                darkShadowColor: Color = .neuDarkShadow,
                lightShadowColor: Color = .neuLightShadow,
                spread: CGFloat = 0.5,
                radius: CGFloat = 10) {
        self.shape = shape
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        self.spread = spread
        self.radius = radius
    }

    public func strokeLineWidth(_ proxy: GeometryProxy) -> CGFloat {
        return proxy.size.width * 0.10
    }
    
    public func strokeLineScale(_ proxy: GeometryProxy) -> CGFloat {
        let lineWidth = strokeLineWidth(proxy)
        return proxy.size.width / CGFloat(proxy.size.width - lineWidth)
    }
    
    public func shadowOffset(_ proxy: GeometryProxy) -> CGFloat {
        return (proxy.size.width <= proxy.size.height ? proxy.size.width : proxy.size.height) * 0.5 * min(max(spread, 0), 1)
    }
    

    public func addSoftInnerShadow(_ content: NeuInnerShadowViewModifier.Content) -> some View {
        return GeometryReader { proxy in
            
            self.shape.fill(self.lightShadowColor)
                .inverseMask(
                    self.shape
                    .offset(x: -self.shadowOffset(proxy), y: -self.shadowOffset(proxy))
                )
                .offset(x: self.shadowOffset(proxy) , y: self.shadowOffset(proxy))
                .blur(radius: self.radius)
                .shadow(color: self.lightShadowColor, radius: self.radius, x: -self.shadowOffset(proxy)/2, y: -self.shadowOffset(proxy)/2 )
                .mask(
                    self.shape
                )
                .overlay(
                    self.shape
                        .fill(self.darkShadowColor)
                        .inverseMask(
                            self.shape
                            .offset(x: self.shadowOffset(proxy), y: self.shadowOffset(proxy))
                        )
                        .offset(x: -self.shadowOffset(proxy) , y: -self.shadowOffset(proxy))
                        .blur(radius: self.radius)
                        .shadow(color: self.darkShadowColor, radius: self.radius, x: self.shadowOffset(proxy)/2, y: self.shadowOffset(proxy)/2 )
                )
                .mask(
                    self.shape
                )
        }
    }

    public func body(content: Content) -> some View {
        content.overlay(
            addSoftInnerShadow(content)
        )
    }
}
