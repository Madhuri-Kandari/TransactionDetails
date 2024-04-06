//
//  File.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import Foundation

class BalanceDetailsViewModel: ObservableObject {
    
    var accountDetailsProtocol: AccountDetailsProtocol!
    
    init(accountDetailsProtocol: AccountDetailsProtocol!) {
        self.accountDetailsProtocol = accountDetailsProtocol
    }
    
    func getAccountName() -> String {
        return accountDetailsProtocol.fetchAccountDetails().accountName
    }
    
    func getAccountNumber() -> String {
        return accountDetailsProtocol.fetchAccountDetails().accountNumber
    }
    
    func getAvailableFunds() -> String {
        let available = accountDetailsProtocol.fetchAccountDetails().available
        return String.init(available)
    }
    
    func getAvailableBalance() -> String {
        let balance = accountDetailsProtocol.fetchAccountDetails().balance
        return String.init(balance)
    }
}
