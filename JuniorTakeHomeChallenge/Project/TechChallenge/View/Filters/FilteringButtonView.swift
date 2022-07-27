//
//  FilteringButtonView.swift
//  TechChallenge
//
//  Created by Emese Toth on 26/07/2022.
//

import SwiftUI

struct FilteringButtonView: View {
    let category: Category
    @EnvironmentObject var vm: TransactionListViewModel
    
    var body: some View {
        Button(action: {
            vm.myCategory = category
        }) {
            Text(category.name.rawValue)
                .foregroundColor(.white)
                .font(.title2.weight(.bold))
                .padding([.leading, .trailing], 15)
                .padding([.top, .bottom], 5)
        }
        .background(RoundedRectangle(cornerRadius: 25)
            .foregroundColor(category.color)
        )
    }
}

struct FilteringButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilteringButtonView(category: Category(name: .all, color: .black))
    }
}
