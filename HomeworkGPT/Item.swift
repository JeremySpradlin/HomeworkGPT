//
//  Item.swift
//  HomeworkGPT
//
//  Created by Jeremy Spradlin on 9/20/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
