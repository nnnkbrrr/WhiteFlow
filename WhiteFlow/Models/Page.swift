//
//  Page.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI
import SwiftData

class Page: Graphic {
    var name: String
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    required init(backingData: any SwiftData.BackingData<Graphic>) {
        fatalError("init(backingData:) has not been implemented")
    }
}
