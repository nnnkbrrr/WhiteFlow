//
//  Vector Layer.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

class VectorLayer: Graphic {
    var rotation: CGFloat
    var fillColor: CGColor
    var strokeColor: CGColor?
    var strokeWidth: CGFloat?
    
    init(rotation: CGFloat, fillColor: CGColor) {
        self.rotation = rotation
        self.fillColor = fillColor
        super.init()
    }
    
    required init(backingData: any SwiftData.BackingData<Graphic>) {
        fatalError("init(backingData:) has not been implemented")
    }
}
