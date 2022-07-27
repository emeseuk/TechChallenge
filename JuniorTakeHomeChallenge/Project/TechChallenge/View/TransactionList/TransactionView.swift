//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionView: View {
    let transaction: TransactionModel
    @State private var isPinned: Bool = false
    @EnvironmentObject var vm: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.category.rawValue)
                    .font(.headline)
                    .foregroundColor(transaction.category.color)
                Spacer()
                Image(systemName: isPinned ? "pin.slash.fill" : "pin.fill" )
            }
            
            HStack {
                transaction.image
                    .resizable()
                    .frame(
                        width: 60.0,
                        height: 60.0,
                        alignment: .top
                    )
                
                VStack(alignment: .leading) {
                    Text(transaction.name)
                        .secondary()
                    Text(transaction.accountName)
                        .tertiary()
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("$\(transaction.amount.formatted())")
                        .bold()
                        .secondary()
                    Text(transaction.date.formatted)
                        .tertiary()
                }
            }
            .frame(maxHeight: isPinned ? 0 : .none)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .gesture(
            TapGesture().onEnded({ _ in
                isPinned = !isPinned
                if let index = vm.pinnedTransactions.firstIndex(where: {$0.transaction == transaction}) {
                    vm.pinnedTransactions[index].pinned = isPinned
                }
            })
        )
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransactionView(transaction: ModelData.sampleTransactions[0])
            TransactionView(transaction: ModelData.sampleTransactions[1])
        }
        .environmentObject(TransactionListViewModel())
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
