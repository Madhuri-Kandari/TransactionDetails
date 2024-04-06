//
//  File.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import Foundation

class BalanceDetailsViewModel: ObservableObject {
    
    var userAccountRepo: UserAccountProtocol!
    
    init(userAccountRepo: UserAccountProtocol!) {
        self.userAccountRepo = userAccountRepo
    }
    
    func getAccountName() -> String {
        return userAccountRepo.fetchAccountDetails()?.accountName ?? "No Account Name"
    }
    
    func getAccountNumber() -> String {
        return userAccountRepo.fetchAccountDetails()?.accountNumber ?? "No Account Number"
    }
    
    func getAvailableFunds() -> String {
        let available = userAccountRepo.fetchAccountDetails()?.available
        return String.init(available ?? 0.0)
    }
    
    func getAvailableBalance() -> String {
        let balance = userAccountRepo.fetchAccountDetails()?.balance
        return String.init(balance ?? 0.0)
    }
}
