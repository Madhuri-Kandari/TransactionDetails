//
//  MockUserAccountRepository.swift
//  TransactionDetailsTests
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import Foundation
@testable import TransactionDetails

class MockUserAccountRepository: UserAccountProtocol {
    
    var userAccount: UserAccountDataResult?
    
    func fetchAccountDetails() -> TransactionDetails.AccountDomainModel? {
        return AccountDomainModel(account: userAccount!.account)
    }
    
    func fetchCompletedTransactionDetails() -> [TransactionDetails.PendingDomainModel]? {
        return [PendingDomainModel(pending: userAccount!.transactions.first!)]
    }
    
    func fetchPendingTransactionDetails() -> [TransactionDetails.PendingDomainModel]? {
        return [PendingDomainModel(pending: userAccount!.pending.first!)]
    }
    
    
}
