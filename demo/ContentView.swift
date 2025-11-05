//
//  ContentView.swift
//  demo
//
//  Created by Kapunahele Wong on 11/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome Back")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.grayText)
                        Text("Sarah Johnson")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.darkBlue)
                    }
                    Spacer()
                    Circle()
                        .fill(Color.lightGold)
                        .frame(width: 48, height: 48)
                        .overlay(
                            Text("SJ")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.darkBlue)
                        )
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 24)
                .background(Color.white)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Checking Account Tile
                        AccountTile(
                            title: "Checking",
                            balance: "$12,459.82",
                            accountNumber: "•••• 4829",
                            backgroundColor: Color.primaryBlue,
                            accentColor: Color.gold,
                            icon: "checkmark.circle.fill"
                        )
                        
                        // Savings Account Tile
                        AccountTile(
                            title: "Savings",
                            balance: "$45,230.15",
                            accountNumber: "•••• 5671",
                            backgroundColor: Color.secondaryBlue,
                            accentColor: Color.gold,
                            icon: "heart.circle.fill"
                        )
                        
                        // Credit Card Tile
                        CreditCardTile(
                            cardholderName: "Sarah Johnson",
                            cardNumber: "•••• •••• •••• 3456",
                            expiryDate: "12/26",
                            availableCredit: "$8,750.00",
                            accentColor: Color.gold
                        )
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 24)
                }
                .background(Color.offWhite)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.darkBlue)
                    }
                }
            }
        }
    }
}

struct AccountTile: View {
    let title: String
    let balance: String
    let accountNumber: String
    let backgroundColor: Color
    let accentColor: Color
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Spacer()
                        .frame(height: 12)
                    
                    Text(balance)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(accountNumber)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
                
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundColor(accentColor)
            }
            .padding(24)
            .background(backgroundColor)
        }
        .cornerRadius(16)
        .frame(height: 180)
    }
}

struct CreditCardTile: View {
    let cardholderName: String
    let cardNumber: String
    let expiryDate: String
    let availableCredit: String
    let accentColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Credit Card")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "creditcard.fill")
                        .font(.system(size: 24))
                        .foregroundColor(accentColor)
                }
                .padding(24)
                .padding(.bottom, 8)
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Card Number")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text(cardNumber)
                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)
                            .tracking(2)
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Card Holder")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.white.opacity(0.7))
                            
                            Text(cardholderName)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text("Expires")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.white.opacity(0.7))
                            
                            Text(expiryDate)
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
                    Text("Available Credit")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.grayText)
                    
                    Text(availableCredit)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.darkBlue)
                }
                
                Spacer()
                
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Text("Pay")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color.primaryBlue)
                            .cornerRadius(8)
                    }
                }
            }
            .padding(20)
            .background(Color.white)
        }
        .cornerRadius(16)
    }
}

extension Color {
    static let darkBlue = Color(red: 0.13, green: 0.33, blue: 0.65)
    static let primaryBlue = Color(red: 0.16, green: 0.42, blue: 0.80)
    static let secondaryBlue = Color(red: 0.22, green: 0.49, blue: 0.76)
    static let lightGold = Color(red: 0.98, green: 0.92, blue: 0.75)
    static let gold = Color(red: 0.96, green: 0.80, blue: 0.40)
    static let offWhite = Color(red: 0.98, green: 0.98, blue: 0.99)
    static let grayText = Color(red: 0.55, green: 0.57, blue: 0.62)
}

#Preview {
    ContentView()
}
