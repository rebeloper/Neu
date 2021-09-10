//
//  View+.swift
//  Neu
//
//  Created by Alex Nagy on 08.09.2021.
//

import SwiftUI

public extension View {

    func neuInnerShadow<S : Shape>(_ content: S,
                                    darkShadow: Color = .neuDarkShadow,
                                    lightShadow: Color = .neuLightShadow,
                                    spread: CGFloat = 0.5,
                                    radius: CGFloat = 10) -> some View {
        modifier(
            NeuInnerShadowViewModifier(shape: content,
                                        darkShadowColor: darkShadow,
                                        lightShadowColor: lightShadow,
                                        spread: spread,
                                        radius: radius)
        )
    }
    
    func neuOuterShadow(darkShadow: Color = .neuDarkShadow,
                        lightShadow: Color = .neuLightShadow,
                        offset: CGFloat = 6,
                        radius:CGFloat = 3) -> some View {
        modifier(NeuOuterShadowViewModifier(darkShadowColor: darkShadow,
                                            lightShadowColor: lightShadow,
                                            offset: offset,
                                            radius: radius))
    }
    
    func inverseMask<Mask>(_ mask: Mask) -> some View where Mask: View {
        self.mask(mask
                    .foregroundColor(.black)
                    .background(Color.white)
                    .compositingGroup()
                    .luminanceToAlpha()
        )
    }
    
}
