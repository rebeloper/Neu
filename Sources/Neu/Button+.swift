//
//  Button+.swift
//  Neu
//
//  Created by Alex Nagy on 09.09.2021.
//

import SwiftUI

public extension Button {

    func neuButtonStyle<S : Shape>(_ content: S,
                                    mainColor : Color = Color.neuPrimary,
                                    textColor : Color = Color.neuSecondary,
                                    darkShadowColor: Color = Color.neuDarkShadow,
                                    lightShadowColor: Color = Color.neuLightShadow,
                                    pressedEffect : NeuButtonPressedEffect = .hard,
                                    padding : CGFloat = 16) -> some View {
        self.buttonStyle(NeuDynamicButtonStyle(content, mainColor: mainColor, textColor: textColor, darkShadowColor: darkShadowColor, lightShadowColor: lightShadowColor, pressedEffect: pressedEffect, padding: padding))
    }

    
}
