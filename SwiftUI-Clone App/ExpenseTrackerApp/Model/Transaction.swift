//
//  Transaction.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/22/24.
//

import SwiftUI

struct Transaction: Identifiable {
    let id: UUID = .init()
    let title: String
    let remarks: String
    let amount: Double
    let dateAdded: Date
    let category: String
    let tintColor: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: ExpenseCategory, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
        //Extracting Color Value from tintColor String
    var color: Color {
        return tints.first(where: { $0.color == tintColor })?.value ?? appTint
    }
}

//Sample Transactions for UI Building

var sampleTransactions: [Transaction] = [
    .init(title: "Magic Keyboard",
          remarks: "Apple Product",
          amount: 129,
          dateAdded: .now,
          category: .expense,
          tintColor: tints.randomElement()!),
    .init(title: "Apple Music",
          remarks: "Subscription",
          amount: 10.99,
          dateAdded: .now,
          category: .expense,
          tintColor: tints.randomElement()!),
    .init(title: "iCloud+",
          remarks: "Subscription",
          amount: 0.99,
          dateAdded: .now,
          category: .expense,
          tintColor: tints.randomElement()!),
    .init(title: "Payment",
          remarks: "Payment Received!",
          amount: 2499,
          dateAdded: .now,
          category: .income,
          tintColor: tints.randomElement()!),
]
