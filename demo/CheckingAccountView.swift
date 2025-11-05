import SwiftUI

struct CheckingAccountView: View {
    let account: CheckingAccount
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Checking")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                        .frame(height: 12)
                                    
                                    Text(account.balance)
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundColor(.white)
                                    
                                    Text(account.accountNumber)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                
                                Spacer()
                                
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 28))
                                    .foregroundColor(Color.gold)
                            }
                            .padding(24)
                            .background(Color.primaryBlue)
                        }
                        .cornerRadius(16)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Recent Transactions")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.darkBlue)
                            
                            VStack(spacing: 12) {
                                ForEach(account.transactions) { transaction in
                                    TransactionRow(transaction: transaction)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 24)
                }
                .background(Color.offWhite)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Checking Account")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.darkBlue)
                }
            }
        }
    }
}

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .center, spacing: 0) {
                Circle()
                    .fill(
                        transaction.category == "Groceries" ? Color.blue.opacity(0.2) :
                        transaction.category == "Income" ? Color.green.opacity(0.2) :
                        transaction.category == "Utilities" ? Color.orange.opacity(0.2) :
                        transaction.category == "Food & Drink" ? Color.red.opacity(0.2) :
                        transaction.category == "Transportation" ? Color.purple.opacity(0.2) :
                        transaction.category == "Dining" ? Color.pink.opacity(0.2) :
                        Color.gray.opacity(0.2)
                    )
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName:
                            transaction.category == "Groceries" ? "cart.fill" :
                            transaction.category == "Income" ? "dollarsign.circle.fill" :
                            transaction.category == "Utilities" ? "bolt.fill" :
                            transaction.category == "Food & Drink" ? "cup.and.saucer.fill" :
                            transaction.category == "Transportation" ? "car.fill" :
                            transaction.category == "Dining" ? "fork.knife" :
                            "arrow.left.right"
                        )
                            .font(.system(size: 18))
                            .foregroundColor(
                                transaction.category == "Groceries" ? Color.blue :
                                transaction.category == "Income" ? Color.green :
                                transaction.category == "Utilities" ? Color.orange :
                                transaction.category == "Food & Drink" ? Color.red :
                                transaction.category == "Transportation" ? Color.purple :
                                transaction.category == "Dining" ? Color.pink :
                                Color.gray
                            )
                    )
            }
            
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
                    .foregroundColor(transaction.isDebit ? .darkBlue : Color.green)
                
                Text(transaction.date)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.grayText)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    CheckingAccountView(account: sampleCheckingAccount)
}
