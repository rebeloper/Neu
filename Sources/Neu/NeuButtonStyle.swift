//
//  NeuButtonStyle.swift
//  Neu
//
//  Created by Alex Nagy on 08.09.2021.
//

import SwiftUI

public enum NeuButtonPressedEffect {
    case none
    case flat
    case hard
}

public struct NeuButtonStyle<S: Shape>: ButtonStyle {
    
    var shape: S
    var fillColor: Color
    var foregroundColor: Color
    var darkShadowColor: Color
    var lightShadowColor: Color
    var pressedEffect: NeuButtonPressedEffect
    var horizontalPadding: CGFloat
    var verticalPadding: CGFloat
    var innerShadowSpread: CGFloat
    var innerShadowRadius: CGFloat
    var outerShadowOffset: CGFloat
    var outerShadowRadius: CGFloat
    var onPressedScaleDownPercentage: CGFloat
    
    public init(_ shape: S,
                fillColor: Color,
                foregroundColor: Color,
                darkShadowColor: Color,
                lightShadowColor: Color,
                pressedEffect: NeuButtonPressedEffect,
                horizontalPadding: CGFloat = 16,
                verticalPadding: CGFloat = 16,
                innerShadowSpread: CGFloat = 0.15,
                innerShadowRadius: CGFloat = 3,
                outerShadowOffset: CGFloat = 6,
                outerShadowRadius: CGFloat = 3,
                onPressedScaleDownPercentage: CGFloat = 0.97) {
        self.shape = shape
        self.fillColor = fillColor
        self.foregroundColor = foregroundColor
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        self.pressedEffect = pressedEffect
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.innerShadowSpread = innerShadowSpread
        self.innerShadowRadius = innerShadowRadius
        self.outerShadowOffset = outerShadowOffset
        self.outerShadowRadius = outerShadowRadius
        self.onPressedScaleDownPercentage = onPressedScaleDownPercentage
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(foregroundColor)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .scaleEffect(configuration.isPressed ? onPressedScaleDownPercentage : 1)
            .background(
                ZStack{
                    if pressedEffect == .flat {
                        shape.stroke(darkShadowColor, lineWidth : configuration.isPressed ? 1 : 0)
                            .opacity(configuration.isPressed ? 1 : 0)
                        shape.fill(fillColor)
                    }
                    else if pressedEffect == .hard {
                        shape.fill(fillColor)
                            .neuInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, spread: innerShadowSpread, radius: innerShadowRadius)
                            .opacity(configuration.isPressed ? 1 : 0)
                    }
                    
                    shape.fill(fillColor)
                        .neuOuterShadow(darkShadow: darkShadowColor, lightShadow: lightShadowColor, offset: outerShadowOffset, radius: outerShadowRadius)
                        .opacity(pressedEffect == .none ? 1 : (configuration.isPressed ? 0 : 1) )
                }
            )
    }
    
}

