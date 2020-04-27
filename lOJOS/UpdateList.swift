//
//  UpdateList.swift
//  lOJOS
//
//  Created by RAAD BADR on 26/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Card1", title: "New Item", text: "text", date: "Jan 1"))
    }
    
    var body: some View {
       
        
        NavigationView {
            
            List {
                
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                
                            }
                        }
                        .padding(.vertical, 8)
                    
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            
                .navigationBarTitle(Text("Updates"))
                
                .navigationBarItems(leading: Button(action: addUpdate) {
                    Text("Add Update")
                    
//                    Rectangle()
//                    .frame(width: 40, height: 5)
//                    .cornerRadius(3)
//                    .opacity(0.5)
                    
                    
                }, trailing: EditButton())
        }
       
    }
}


struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "Air", text: "Fast Shipment using Cargo Air lines", date: "JAN 1"),
    Update(image: "Card2", title: "Ocean", text: "Shipment using Ocean Shipping lines", date: "OCT 17"),
     Update(image: "Card2", title: "Land", text: "Shipment using Trucks", date: "OCT 17")
    
]
