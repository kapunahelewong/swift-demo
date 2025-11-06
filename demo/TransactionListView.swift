//
//  TransactionListView.swift
//  demo
//
//  Created by Kapunahele Wong on 11/5/25.
//

import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let description: String
    let amount: String
    let date: String
    let category: String
    let isDebit: Bool
}

struct TransactionListView: View {
    let accountTitle: String
    let accountBalance: String
    let accountNumber: String
    let transactions: [Transaction]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 12) {
                Text(accountTitle)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.grayText)
                
                Text(accountBalance)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.darkBlue)
                
                Text(accountNumber)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.grayText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
            .background(Color.white)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Recent Transactions")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.darkBlue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                
                Divider()
                    .padding(.horizontal, 20)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(transactions) { transaction in
                            VStack(spacing: 0) {
                                HStack(alignment: .center, spacing: 12) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(transaction.description)
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundColor(.darkBlue)
                                        
                                        Text(transaction.category)
                                            .font(.system(size: 12, weight: .regular))
                                            .foregroundColor(.grayText)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text(transaction.amount)
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundColor(transaction.isDebit ? .darkBlue : .primaryBlue)
                                        
                                        Text(transaction.date)
                                            .font(.system(size: 12, weight: .regular))
                                            .foregroundColor(.grayText)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                
                                Divider()
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                }
            }
            .background(Color.offWhite)
            
            Spacer()
        }
        .background(Color.offWhite)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Account Details")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.darkBlue)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TransactionListView(
            accountTitle: "Checking",
            accountBalance: "$12,459.82",
            accountNumber: "•••• 4829",
            transactions: [
                Transaction(
                    description: "Starbucks Coffee",
                    amount: "-$5.42",
                    date: "Today",
                    category: "Dining",
                    isDebit: true
                ),
                Transaction(
                    description: "Direct Deposit",
                    amount: "+$2,500.00",
                    date: "Nov 1",
                    category: "Income",
                    isDebit: false
                ),
                Transaction(
                    description: "Whole Foods Market",
                    amount: "-$87.34",
                    date: "Nov 1",
                    category: "Groceries",
                    isDebit: true
                ),
                Transaction(
                    description: "Amazon Purchase",
                    amount: "-$45.99",
                    date: "Oct 31",
                    category: "Shopping",
                    isDebit: true
                ),
                Transaction(
                    description: "Gym Membership",
                    amount: "-$50.00",
                    date: "Oct 30",
                    category: "Health",
                    isDebit: true
                )
            ]
        )
    }
}
