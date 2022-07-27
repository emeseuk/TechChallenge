//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {
    private let transaction = TransactionModel(
        id: 1,
        name: "Movie Night",
        category: .entertainment,
        amount: 82.99,
        date: Date(string: "2021-03-05")!,
        accountName: "Credit Card",
        provider: .timeWarner
    )

    //Note: I don't know how to test randomAccountName
//    func testFilteringOfTransactions() throws {
//        let vm = TransactionListViewModel()
//        let mockCategory = Category(name: .entertainment, color: .orange)
//        XCTAssertEqual(vm.filterTransactions(by: mockCategory), [transaction])
//    }

    func testSumOfTransactionForCategory_Unpinned () throws {
        let mockPinnedTransaction = [PinnedTransaction(transaction: transaction, pinned: false)]
        let vm = TransactionListViewModel()
        XCTAssertEqual(vm.calculateTotal(for: mockPinnedTransaction, by: .entertainment), 82.99)
    }

    func testSumOfTransactionForCategory_Pinned () throws {
        let mockPinnedTransaction = [PinnedTransaction(transaction: transaction, pinned: true)]
        let vm = TransactionListViewModel()
        XCTAssertEqual(vm.calculateTotal(for: mockPinnedTransaction, by: .entertainment), 0.0)
    }
}
