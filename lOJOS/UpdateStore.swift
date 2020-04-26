//
//  UpdateStore.swift
//  lOJOS
//
//  Created by RAAD BADR on 26/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
