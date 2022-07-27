//
//  FilteringListView.swift
//  TechChallenge
//
//  Created by Emese Toth on 26/07/2022.
//

import SwiftUI

struct FilteringListView: View {
    private let categories = [
        Category(name: .all, color: .black),
        Category(name: .food, color: .green),
        Category(name: .health, color: .red),
        Category(name: .entertainment, color: .orange),
        Category(name: .shopping, color: .blue),
        Category(name: .travel, color: .purple)]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    FilteringButtonView(category: category)
                }
            }
        }
        .padding()
        .background(Color.accentColor.opacity(0.8))
    }
}

struct FilteringListView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringListView()
    }
}
