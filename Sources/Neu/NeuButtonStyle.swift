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

public struct NeuDynamicButtonStyle<S: Shape> : ButtonStyle {

    var shape: S
    var mainColor : Color
    var textColor : Color
    var darkShadowColor : Color
    var lightShadowColor : Color
    var pressedEffect : NeuButtonPressedEffect
    var padding : CGFloat
    
    public init(_ shape: S,
                mainColor : Color,
                textColor : Color,
                darkShadowColor: Color,
                lightShadowColor: Color,
                pressedEffect : NeuButtonPressedEffect,
                padding : CGFloat = 16) {
        self.shape = shape
        self.mainColor = mainColor
        self.textColor = textColor
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        self.pressedEffect = pressedEffect
        self.padding = padding
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(textColor)
                .padding(padding)
                .scaleEffect(configuration.isPressed ? 0.97 : 1)
                .background(
                    ZStack{
                        if pressedEffect == .flat {
                            shape.stroke(darkShadowColor, lineWidth : configuration.isPressed ? 1 : 0)
                            .opacity(configuration.isPressed ? 1 : 0)
                            shape.fill(mainColor)
                        }
                        else if pressedEffect == .hard {
                            shape.fill(mainColor)
                                .neuInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, spread: 0.15, radius: 3)
                                .opacity(configuration.isPressed ? 1 : 0)
                        }
                        
                        shape.fill(mainColor)
                            .neuOuterShadow(darkShadow: darkShadowColor, lightShadow: lightShadowColor, offset: 6, radius: 3)
                            .opacity(pressedEffect == .none ? 1 : (configuration.isPressed ? 0 : 1) )
                    }
                )
    }
    
}

