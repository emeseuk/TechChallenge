//
//  TransactionListViewModel.swift
//  TechChallenge
//
//  Created by Emese Toth on 26/07/2022.
//

import Foundation
import SwiftUI

struct PinnedTransaction {
    let transaction: TransactionModel
    var pinned: Bool
}

class TransactionListViewModel: ObservableObject {
    @Published var myCategory = Category(name: .all, color: .black)
    @Published var pinnedTransactions: [PinnedTransaction] = []
    @Published var insightsDictionary: [String: Double] = [:]

    let transactions: [TransactionModel] = ModelData.sampleTransactions
    
    init() {
        pinnedTransactions = transactions.compactMap({PinnedTransaction(transaction: $0, pinned: false)})
    }
    
    func calculateTotal(for transactions: [PinnedTransaction], by category: CategoryType) -> Double {
        switch category {
        case .all:
            let filterPinned = transactions.filter { myTransaction in
                myTransaction.pinned == false
            }
            let total = filterPinned.compactMap{$0.transaction.amount}.reduce(0, +)
            return total
        default:
            let filteredByCategory = transactions.filter{$0.transaction.category.rawValue == category.rawValue}
            let filterPinned = filteredByCategory.filter { myTransaction in
                myTransaction.pinned == false
            }
            let total = filterPinned.compactMap{$0.transaction.amount}.reduce(0, +)
            return total
        }
    }
    
    func createInsights(for transactions: [PinnedTransaction]) {
        let categories = TransactionModel.Category.allCases
        categories.forEach { category in
            let filteredByCategory = transactions.filter{$0.transaction.category.rawValue == category.rawValue}
            let filterPinned = filteredByCategory.filter { transaction in
                transaction.pinned == false
            }
            let total = filterPinned.compactMap{$0.transaction.amount}.reduce(0, +)
            insightsDictionary[category.rawValue] = total
        }
    }
}
