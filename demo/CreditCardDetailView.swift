import SwiftUI

struct CreditCardDetailView: View {
    let account: CreditCardAccount
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        VStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("Credit Card")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "creditcard.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(Color.gold)
                                }
                                .padding(24)
                                .padding(.bottom, 8)
                                
                                VStack(alignment: .leading, spacing: 20) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Card Number")
                                            .font(.system(size: 12, weight: .regular))
                                            .foregroundColor(.white.opacity(0.7))
                                        
                                        Text(account.cardNumber)
                                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                                            .foregroundColor(.white)
                                            .tracking(2)
                                    }
                                    
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Card Holder")
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.white.opacity(0.7))
                                            
                                            Text(account.cardholderName)
                                                .font(.system(size: 14, weight: .semibold))
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing, spacing: 4) {
                                            Text("Expires")
                                                .font(.system(size: 12, weight: .regular))
                                                .foregroundColor(.white.opacity(0.7))
                                            
                                            Text(account.expiryDate)
                                                .font(.system(size: 14, weight: .semibold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 24)
                            }
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.darkBlue, Color.primaryBlue.opacity(0.8)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            
                            HStack(spacing: 0) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Current Balance")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.grayText)
                                    
                                    Text(account.balance)
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.darkBlue)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 4) {
                                    Text("Available Credit")
                                        .font(.system(size: 12, weight: .regular))
                                        .foregroundColor(.grayText)
                                    
                                    Text(account.availableCredit)
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.darkBlue)
                                }
                            }
                            .padding(20)
                            .background(Color.white)
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
                    Text("Credit Card")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.darkBlue)
                }
            }
        }
    }
}

#Preview {
    CreditCardDetailView(account: sampleCreditCardAccount)
}
