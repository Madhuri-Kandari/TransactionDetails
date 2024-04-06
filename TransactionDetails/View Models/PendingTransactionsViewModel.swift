//
//  TransactionDetailsViewModel.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import Foundation

class PendingTransactionsViewModel: ObservableObject {
    
    var userAccountRepo: UserAccountProtocol!
    
    init(userAccountRepo: UserAccountProtocol) {
        self.userAccountRepo = userAccountRepo
    }
    
    func getCompletedTransations() -> [PendingDomainModel] {
        return userAccountRepo.fetchCompletedTransactionDetails() ?? []
    }
    
    func getPendingTransactions() -> [PendingDomainModel] {
        return userAccountRepo.fetchPendingTransactionDetails() ?? []
    }
}