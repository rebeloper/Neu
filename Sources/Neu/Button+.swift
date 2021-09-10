//
//  Button+.swift
//  Neu
//
//  Created by Alex Nagy on 09.09.2021.
//

import SwiftUI

public extension Button {

    func neuButtonStyle<S : Shape>(_ content: S,
                                    fillColor : Color = .neuPrimary,
                                    foregroundColor : Color = .neuSecondary,
                                    darkShadowColor: Color = Color.neuDarkShadow,
                                    lightShadowColor: Color = Color.neuLightShadow,
                                    pressedEffect : NeuButtonPressedEffect = .hard,
                                   horizontalPadding : CGFloat = 16,
                                   verticalPadding: CGFloat = 16,
                                   innerShadowSpread: CGFloat = 0.15,
                                   innerShadowRadius: CGFloat = 3,
                                   outerShadowOffset: CGFloat = 6,
                                   outerShadowRadius: CGFloat = 3,
                                   onPressedScaleDownPercentage: CGFloat = 0.97) -> some View {
        self.buttonStyle(NeuButtonStyle(content,
                                        fillColor: fillColor,
                                        foregroundColor: foregroundColor,
                                        darkShadowColor: darkShadowColor,
                                        lightShadowColor: lightShadowColor,
                                        pressedEffect: pressedEffect,
                                        horizontalPadding: horizontalPadding,
                                        verticalPadding: verticalPadding,
                                        innerShadowSpread: innerShadowSpread,
                                        innerShadowRadius: innerShadowRadius,
                                        outerShadowOffset: outerShadowOffset,
                                        outerShadowRadius: outerShadowRadius,
                                        onPressedScaleDownPercentage: onPressedScaleDownPercentage))
    }

    
}
