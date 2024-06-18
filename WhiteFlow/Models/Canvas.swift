//
//  Canvas.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

class Canvas: Graphic {
    var name: String
    var backgroundColor: Color
    
    init(name: String, backgroundColor: Color) {
        self.name = name
        self.backgroundColor = backgroundColor
        super.init()
    }
    
    required init(backingData: any SwiftData.BackingData<Graphic>) {
        fatalError("init(backingData:) has not been implemented")
    }
}
