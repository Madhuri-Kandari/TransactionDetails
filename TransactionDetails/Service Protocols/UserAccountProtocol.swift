//
//  AccountDetailsViewModel.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import Foundation

protocol UserAccountProtocol: AnyObject {
    
    func fetchUserAccounts() -> UserAccountDataResult
    func fetchAccountDetails() -> Account
    func fetchCompletedTransactionDetails() -> [Pending]
    func fetchPendingTransactionDetails() -> [Pending]
}
