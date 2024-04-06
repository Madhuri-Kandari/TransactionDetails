//
//  UserAccountRepository.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import Foundation

class UserAccountRepository: UserAccountProtocol {
    
    var jsonRequestProtocol: JSONRequestProtocol!
    
    init(jsonRequestProtocol: JSONRequestProtocol!) {
        self.jsonRequestProtocol = jsonRequestProtocol
    }
    
    func fetchUserAccounts() -> UserAccountDataResult {
        return jsonRequestProtocol.load("Sample")
    }
    
    func fetchAccountDetails() -> Account {
        return fetchUserAccounts().account
    }
    
    func fetchCompletedTransactionDetails() -> [Pending] {
        return fetchUserAccounts().transactions
    }
    
    func fetchPendingTransactionDetails() -> [Pending] {
        return fetchUserAccounts().pending
    }
}
