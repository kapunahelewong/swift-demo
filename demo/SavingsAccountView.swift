import SwiftUI

struct SavingsAccountView: View {
    let account: SavingsAccount
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Savings")
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
                                
                                Image(systemName: "heart.circle.fill")
                                    .font(.system(size: 28))
                                    .foregroundColor(Color.gold)
                            }
                            .padding(24)
                            .background(Color.secondaryBlue)
                        }
                        .cornerRadius(16)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Interest Rate")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.grayText)
                                    
                                    Text(account.interestRate)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.darkBlue)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 4) {
                                    Text("Account Type")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.grayText)
                                    
                                    Text("High Yield")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.darkBlue)
                                }
                            }
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(12)
                        }
                        
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
                    Text("Savings Account")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.darkBlue)
                }
            }
        }
    }
}

#Preview {
    SavingsAccountView(account: sampleSavingsAccount)
}
