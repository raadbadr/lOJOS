//
//  MenuView.swift
//  lOJOS
//
//  Created by RAAD BADR on 25/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Eng.Raad Badr - 69% Complete")
                    
                    .font(.system(size: 22, weight: .light))
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .multilineTextAlignment(.center)
                
                
                Color.white
                    .frame(width: 38, height: 8)
                    .cornerRadius(6)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1))
                    .cornerRadius(12)
                
                
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Account", icon: "person.crop.circle")
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8319212148, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
        
            .overlay(
                Image("Eng.Raad")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 69, height:69)
                    .clipShape(Circle())
                    .shadow(radius: 20)
                    .offset(y: -169)
                )
            
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            
    }
}


struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width:32 , height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            
            Text(title)
                .font(.system(size: 20, weight: .light, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
