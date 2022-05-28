//
//  Grid.swift
//  Memorize
//
//  Created by 薛勇 on 2022/5/28.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewFormItem: (Item) -> ItemView
    
    init(_ items: [Item], viewFormItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewFormItem = viewFormItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(in: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(in layout: GridLayout) -> some View {
        ForEach(items) { item in
            viewFormItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: items.firstIndex(where: { $0.id == item.id })!))
        }
    }
}
