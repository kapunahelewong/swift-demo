import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let description: String
    let amount: String
    let date: String
    let category: String
    let isDebit: Bool
}

struct CheckingAccount {
    let balance: String
    let accountNumber: String
    let transactions: [Transaction]
}

struct SavingsAccount {
    let balance: String
    let accountNumber: String
    let interestRate: String
    let transactions: [Transaction]
}

struct CreditCardAccount {
    let cardholderName: String
    let cardNumber: String
    let expiryDate: String
    let availableCredit: String
    let balance: String
    let transactions: [Transaction]
}

// Sample data
let sampleCheckingAccount = CheckingAccount(
    balance: "$12,459.82",
    accountNumber: "•••• 4829",
    transactions: [
        Transaction(description: "Whole Foods Market", amount: "-$47.82", date: "Today", category: "Groceries", isDebit: true),
        Transaction(description: "Salary Deposit", amount: "+$3,500.00", date: "Oct 31", category: "Income", isDebit: false),
        Transaction(description: "Electric Bill Payment", amount: "-$156.30", date: "Oct 30", category: "Utilities", isDebit: true),
        Transaction(description: "Coffee Shop", amount: "-$5.42", date: "Oct 29", category: "Food & Drink", isDebit: true),
        Transaction(description: "Gas Station", amount: "-$52.15", date: "Oct 28", category: "Transportation", isDebit: true),
        Transaction(description: "Restaurant", amount: "-$78.95", date: "Oct 27", category: "Dining", isDebit: true),
        Transaction(description: "Online Transfer", amount: "+$1,000.00", date: "Oct 25", category: "Transfer", isDebit: false)
    ]
)

let sampleSavingsAccount = SavingsAccount(
    balance: "$45,230.15",
    accountNumber: "•••• 5671",
    interestRate: "4.5%",
    transactions: [
        Transaction(description: "Interest Earned", amount: "+$45.23", date: "Oct 31", category: "Interest", isDebit: false),
        Transaction(description: "Transfer from Checking", amount: "+$2,000.00", date: "Oct 28", category: "Transfer", isDebit: false),
        Transaction(description: "Interest Earned", amount: "+$44.80", date: "Sep 30", category: "Interest", isDebit: false),
        Transaction(description: "Withdrawal", amount: "-$5,000.00", date: "Sep 15", category: "Withdrawal", isDebit: true),
        Transaction(description: "Transfer from Checking", amount: "+$3,000.00", date: "Sep 10", category: "Transfer", isDebit: false),
        Transaction(description: "Interest Earned", amount: "+$43.15", date: "Aug 31", category: "Interest", isDebit: false),
        Transaction(description: "Initial Deposit", amount: "+$10,000.00", date: "Aug 01", category: "Deposit", isDebit: false)
    ]
)

let sampleCreditCardAccount = CreditCardAccount(
    cardholderName: "Sarah Johnson",
    cardNumber: "•••• •••• •••• 3456",
    expiryDate: "12/26",
    availableCredit: "$8,750.00",
    balance: "$1,250.00",
    transactions: [
        Transaction(description: "Amazon Prime", amount: "-$14.99", date: "Today", category: "Subscription", isDebit: true),
        Transaction(description: "Netflix", amount: "-$15.99", date: "Oct 31", category: "Subscription", isDebit: true),
        Transaction(description: "Airline Ticket", amount: "-$456.00", date: "Oct 28", category: "Travel", isDebit: true),
        Transaction(description: "Hotel Booking", amount: "-$285.50", date: "Oct 27", category: "Travel", isDebit: true),
        Transaction(description: "Gas Station", amount: "-$68.42", date: "Oct 25", category: "Transportation", isDebit: true),
        Transaction(description: "Restaurant", amount: "-$125.75", date: "Oct 23", category: "Dining", isDebit: true),
        Transaction(description: "Online Shopping", amount: "-$249.99", date: "Oct 20", category: "Shopping", isDebit: true)
    ]
)
