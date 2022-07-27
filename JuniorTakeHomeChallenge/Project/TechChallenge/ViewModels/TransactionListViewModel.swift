//
//  TransactionListViewModel.swift
//  TechChallenge
//
//  Created by Emese Toth on 26/07/2022.
//

import Foundation

class TransactionListViewModel: ObservableObject {
    @Published var myCategory = Category(name: .all, color: .black)
}
