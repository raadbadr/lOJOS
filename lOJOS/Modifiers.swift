//
//  Modifiers.swift
//  lOJOS
//
//  Created by RAAD BADR on 27/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1), radius: 10, x: 0, y: 12)
        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1), radius: 1, x: 0, y: 1)
    }
}


struct FontModifier: ViewModifier {
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .rounded))
    }
}

struct CustomFontModifier: ViewModifier {
        var size: CGFloat = 28
    
        func body(content: Content) -> some View {
        content.font(.custom("WorkSans-Bold", size: size))
               
       }
}
