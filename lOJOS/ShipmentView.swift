//
//  ContentView.swift
//  lOJOS
//
//  Created by RAAD BADR on 23/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct ShipmentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false //for bottom card
    
    var body: some View
    {
        ZStack
            {
                //this for title
                TitleView()
                    .blur(radius: show ? 20 : 0)
                    .opacity(showCard ? 0.4 : 1)
                    .offset(y: showCard ? -200 : 0)
                    .animation(
                        Animation
                            .default
                            .delay(0.1)
                        //                        .speed(2)
                        //                        .repeatCount(3, autoreverses: false)
                )
                
                
                //the third card
                BackCardView()
                    .frame(width: showCard ? 300 : 340, height: 220)
                    .background(show ? Color("card3") : Color("card4"))
                    .cornerRadius(25)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -400 : -40)
                    .offset(x: viewState.width, y:viewState.height)
                    .offset(y: showCard ? -180 : 0)
                    .scaleEffect(showCard ? 1 : 0.9)
                    //show if true = 0 if false = 5
                    .rotationEffect(Angle.degrees(show ? 0 : 10))
                    .rotationEffect(Angle.degrees(showCard ? -10 : 0))
                    .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10.0, y: 0, z: 0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.5))
                
                //the second card
                BackCardView()
                    .frame(width: 340, height: 220)
                    .background(show ? Color("card4") : Color("card3"))
                    .cornerRadius(25)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -200 : -20)
                    .offset(y: showCard ? -140 : 0)
                    .offset(x: viewState.width, y:viewState.height)
                    .scaleEffect(showCard ? 1 : 0.95)
                    .rotationEffect(Angle.degrees(show ? 0 : 5))
                    .rotationEffect(Angle.degrees(showCard ? -5 : 0))
                    .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10.0, y: 0, z: 0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.3))
                
                //the front card
                
                CardView()
                    .frame(width: showCard ? 370 : 340, height: 220)
                    .background(Color.orange)
                    //                .cornerRadius(25)
                    .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                    .shadow(radius: 20)
                    .offset(x: viewState.width, y:viewState.height)
                    .offset(y: showCard ? -100 : 0)
                    //.blendMode(.hardLight)
                    .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                    .onTapGesture {
                        self.showCard.toggle()
                }
                    
                .gesture(
                    DragGesture().onChanged{ value in
                        self.viewState = value.translation
                        self.show = true
                        
                    }
                    .onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
                )
                
                //the bottom information
                
                //            Text("\(bottomState.height)")
                //                .offset(y: -300)
                
                BottomCardView()
                    .offset(x: 0, y: showCard ? 360 : 1000)
                    .offset(y: bottomState.height)
                    .blur(radius: show ? 20 : 0)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                    .gesture(
                        DragGesture().onChanged { value in
                            self.bottomState = value.translation
                            
                            if self.showFull {
                                self.bottomState.height += -300
                            }
                            // will not show bottom of card
                            if self.bottomState.height < -300 {
                                self.bottomState.height = -300
                            }
                        }
                        .onEnded { value in
                            if self.bottomState.height > 50 {
                                self.showCard = false
                            }
                            
                            if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                                self.bottomState.height = -300
                                self.showFull = true
                            } else {
                                self.bottomState = .zero
                                self.showFull = false
                            }
                            
                        }
                )
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ShipmentView()
    }
}



struct CardView: View {
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text("Import")
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    Text("Ocean")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
            Spacer()
            Image("Card3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height:110, alignment: .top)
            
        }
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack{
            
            HStack{
                Text("Shipment Type")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .font(.headline)
                
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.2)
            Text("Shippemnt types are 3 types Ocean Land and Air")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            Spacer()
            
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        
    }
}
