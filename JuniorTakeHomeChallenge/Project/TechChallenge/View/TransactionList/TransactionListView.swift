//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @EnvironmentObject var vm: TransactionListViewModel
    
    var body: some View {
        VStack {
            FilteringListView()
            List {
                ForEach(filteredTransactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            FloatingSumView(category: vm.myCategory, total: totalCount)
        .navigationTitle("Transactions")
        }
    }
    
    var filteredTransactions: [TransactionModel] {
        switch vm.myCategory.name {
        case .all:
            return transactions
        case .food:
            return transactions.filter{ $0.category.rawValue == vm.myCategory.name.rawValue }
        case .health:
            return transactions.filter{ $0.category.rawValue == vm.myCategory.name.rawValue }
        case .entertainment:
            return transactions.filter{ $0.category.rawValue == vm.myCategory.name.rawValue }
        case .shopping:
            return transactions.filter{ $0.category.rawValue == vm.myCategory.name.rawValue }
        case .travel:
            return transactions.filter{ $0.category.rawValue == vm.myCategory.name.rawValue }
        }
    }
    
    var totalCount: Double {
        let total = vm.calculateTotal(for: vm.pinnedTransactions, by: vm.myCategory.name)
        return total
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
            .environmentObject(TransactionListViewModel())
    }
}
#endif
