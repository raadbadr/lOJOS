//
//  RingView.swift
//  lOJOS
//
//  Created by RAAD BADR on 27/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), style: StrokeStyle(lineWidth: 5))
                .frame(width: 69, height: 69)
            Circle()
                .trim(from: 0.1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
            )
            .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y:0, z:0))
                .frame(width: 69, height: 69)
                .shadow(color: Color(#colorLiteral(red: 0.3647058824, green: 0.06666666667, blue: 0.968627451, alpha: 1)).opacity(0.2), radius: 3, x: 0, y: 3)
            
            Text("82%")
                .font(.subheadline)
                .fontWeight(.bold)
        }
            
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
