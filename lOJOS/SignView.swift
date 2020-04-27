//
//  SignView.swift
//  lOJOS
//
//  Created by RAAD BADR on 23/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI
import AuthenticationServices
import Lottie



struct SignView: View {
    var body: some View {
        
        NavigationView {
            VStack
                {
                    
                    NavigationLink(destination: ShipmentView()) {
                        Text("Go To Main Menu")
                    }
                    
            }
   
        }
        
    }
    
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
