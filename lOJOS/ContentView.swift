//
//  ContentView.swift
//  lOJOS
//
//  Created by RAAD BADR on 23/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View
    {
        ZStack
        {
            TitleView()
            
            BackCardView()
                .background(Color("card3"))
                .cornerRadius(25)
                .shadow(radius: 20)
                .offset(x: 0, y: -40)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: 10))
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10.0, y: 0, z: 0))
//                .blendMode(.hardLight)
            
            BackCardView()
                .background(Color("card1"))
                .cornerRadius(25)
                .shadow(radius: 20)
                .offset(x: 0, y: -20)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0, z: 0))
//                .blendMode(.hue)
           
            
            CardView()
            .blendMode(.hue)
        }
        
        
        
    }
    
        
}

struct ContentView_Previews: PreviewProvider
    {
    static var previews: some View
        {
        ContentView()
        }
    }



struct CardView: View {
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text("Import")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Text("Ocean")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height:110, alignment: .top)
            
        }
        .frame(width: 340, height: 220)
        .background(Color.blue)
        .cornerRadius(25)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(width: 340, height: 220)
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack{
            
            HStack{
                Text("Shippment Type")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}
