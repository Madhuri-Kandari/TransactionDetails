//
//  UserAccountRepository.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import Foundation

class UserAccountRepository: UserAccountProtocol {
    
    private var userAccount: UserAccountDomainResult?
    private var fileName: String = "Sample"
    var jsonRequestProtocol: JSONRequestProtocol!
    
    init(jsonRequestProtocol: JSONRequestProtocol!) {
        self.jsonRequestProtocol = jsonRequestProtocol
        fetchUserAccounts()
    }
    
    private func fetchUserAccounts() {
        let userAccountDataResult: UserAccountDataResult =  jsonRequestProtocol.load(fileName)
        userAccount = UserAccountDomainResult(account: userAccountDataResult.account, transactions: userAccountDataResult.transactions, pendings: userAccountDataResult.pending)
        
    }
    
    func fetchAccountDetails() -> AccountDomainModel? {
        return userAccount?.account
    }
    
    func fetchCompletedTransactionDetails() -> [PendingDomainModel]? {
        return userAccount?.transactions.sorted {Utility.formattedDateFromString(dateString: $0.effectiveDate ?? "", withFormat: "MM-dd-yyyy")?.compare(Utility.formattedDateFromString(dateString: $1.effectiveDate ?? "", withFormat: "MM-dd-yyyy") ?? "", options: .numeric) == .orderedDescending}
    }
    
    func fetchPendingTransactionDetails() -> [PendingDomainModel]? {
        return userAccount?.pendings.sorted {Utility.formattedDateFromString(dateString: $0.effectiveDate ?? "", withFormat: "MM-dd-yyyy")?.compare(Utility.formattedDateFromString(dateString: $1.effectiveDate ?? "", withFormat: "MM-dd-yyyy") ?? "", options: .numeric) == .orderedDescending}
    }
}
