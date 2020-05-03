//
//  RingView.swift
//  lOJOS
//
//  Created by RAAD BADR on 27/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    var color1 = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    var color2 = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 269
    var height: CGFloat = 269
    var percent:CGFloat = 50
    
    //to call from out side --> and look at line 57-58
    @Binding var show: Bool
    
    var body: some View {
        
       
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        return ZStack {
            Circle()
                .stroke(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
            )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y:0, z:0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.2), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        
        //here
        RingView(show: .constant(true))
    }
}
