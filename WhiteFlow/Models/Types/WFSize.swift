//
//  WFSize.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import Foundation
import SwiftData

@Model
class WFSize {
    var width: CGPoint
    var height: CGPoint
    
    init(width: CGPoint, height: CGPoint) {
        self.width = width
        self.height = height
    }
}
