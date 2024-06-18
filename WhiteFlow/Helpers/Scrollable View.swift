//
//  Scrollable View.swift
//  WhiteFlow
//
//  Created by Nikita on 6/17/24.
//

import SwiftUI

private protocol ScrollViewDelegateProtocol {
    func scrollWheel(with event: NSEvent);
}

private class ScrollView: NSView {
    var delegate: ScrollViewDelegateProtocol!
    override func scrollWheel(with event: NSEvent) {
        delegate.scrollWheel(with: event)
    }
}

private struct ScrollableSubstrate: NSViewRepresentable, ScrollViewDelegateProtocol {
    typealias NSViewType = ScrollView
    
    private var scrollAction: ((NSEvent) -> Void)?
    
    func makeNSView(context: Context) -> ScrollView {
        let view = ScrollView()
        view.delegate = self
        
        return view
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) { }
    
    func scrollWheel(with event: NSEvent) {
        if let scrollAction = scrollAction {
            scrollAction(event)
        }
    }
    
    func onScroll(_ action: @escaping (NSEvent) -> Void) -> Self {
        var newSelf = self
        newSelf.scrollAction = action
        return newSelf
    }
}

public struct ScrollableView<Content: View>: View {
    @ViewBuilder var content: Content
    
    @State private var offset: CGSize = .zero
    @State private var tempZoom = 0.0
    @State private var zoom = 1.0
    
    init(content: @escaping () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        content
            .overlay(content: {
                VStack{
                    Text("\(zoom)")
                    Text("\(tempZoom)")
                }
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(offset)
            .scaleEffect(zoom + tempZoom)
            .overlay {
                ScrollableSubstrate()
                    .onScroll { event in
                        offset = CGSize(
                            width: offset.width + event.scrollingDeltaX,
                            height: offset.height + event.scrollingDeltaY
                        )
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(nsColor: .darkGray))
            .frame(minWidth: 500, minHeight: 500)
            .gesture(
                MagnificationGesture()
                    .onChanged {
                        print($0)
                        tempZoom = $0 - 1
                        if zoom + tempZoom < 0.2 {
                            zoom = 0.21
                            tempZoom = 0
                        }
                    }
                    .onEnded { _ in
                        zoom += tempZoom
                        tempZoom = 0
                        if zoom + tempZoom < 0.2 {
                            zoom = 0.21
                        }
                    }
            )
    }
}
