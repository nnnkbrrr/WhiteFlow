//
//  WFPoint.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import Foundation
import SwiftData

@Model
class WFPoint {
    var x: CGPoint
    var y: CGPoint
    
    init(x: CGPoint, y: CGPoint) {
        self.x = x
        self.y = y
    }
}
