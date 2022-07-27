//
//  FloatingSumView.swift
//  TechChallenge
//
//  Created by Emese Toth on 27/07/2022.
//

import SwiftUI

struct FloatingSumView: View {
    let category: Category
    let total: Double
    
    var body: some View {
            VStack {
                Text(category.name.rawValue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 15)
                    .padding(.top, 10)
                    .foregroundColor(category.color)
                    .font(.headline)
                HStack {
                    Text("Total spent:")
                        .secondary()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .foregroundColor(.black)
                    Text("$\(total, specifier: "%.2f")")
                        .bold()
                        .secondary()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 15)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                .stroke(Color.accentColor, lineWidth: 2)
            )
            .padding([.leading, .trailing], 10.0)
        
    }
}

struct FloatingSumView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingSumView(category: Category(name: .all, color: .black), total: 100)
    }
}
