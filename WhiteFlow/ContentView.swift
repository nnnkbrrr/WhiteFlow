//
//  ContentView.swift
//  WhiteFlow
//
//  Created by Nikita on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: WFlowEditDocument

    var body: some View {
        Text("Hello world!")
    }
}

#Preview {
    ContentView(document: .constant(WFlowEditDocument()))
}
