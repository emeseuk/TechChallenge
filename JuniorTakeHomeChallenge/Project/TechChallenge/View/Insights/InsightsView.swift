//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    let transactions: [TransactionModel] = ModelData.sampleTransactions
    @EnvironmentObject var vm: TransactionListViewModel
    
    var body: some View {
        List {
            ForEach(TransactionModel.Category.allCases) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    // TODO: calculate cummulative expense for each category
                    Text("$\(vm.insightsDictionary[category.rawValue] ?? 0, specifier: "%.2f")")
                        .bold()
                        .secondary()
                }
            }
        }
        .onAppear {
            vm.createInsights(for: vm.pinnedTransactions)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
            .previewLayout(.sizeThatFits)
            .environmentObject(TransactionListViewModel())
    }
}
#endif
