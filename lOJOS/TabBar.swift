//
//  TabBar.swift
//  lOJOS
//
//  Created by RAAD BADR on 27/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            ShipmentView().tabItem {
                Image(systemName: "square.stack.fill")
                Text("Shipment Type")
            }
        }
            
//        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone Xs Max")
        }
    }
}
