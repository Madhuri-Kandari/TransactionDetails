//
//  UserAccountDomainModel.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

//import Foundation
//
//class UserAccountDomainResult {
//    var account: AccountDomainModel?
//    var transactions, pending: [PendingDomainModel]?
//    
//    init() {}
//}
//
//extension UserAccountDomainResult {
//    convenience init(userAccountDataResult: UserAccountDataResult) {
//        self.init()
//        self.account?.transform(account: userAccountDataResult.account)
//        self.transactions?.forEach { transaction in
//            transaction.transform(pendings: userAccountDataResult.transactions)
//        }
//        self.pending?.forEach { pendingTransaction in
//            pendingTransaction.transform(pendings: userAccountDataResult.pending)
//        }
//    }
//}
//
//class AccountDomainModel {
//    var accountName, accountNumber: String?
//    var available, balance: Double?
//    
//    init() {}
//}
//
//extension AccountDomainModel {
//    func transform(account: Account) {
//        self.accountName = account.accountName
//        self.accountNumber = account.accountNumber
//        self.available = account.available
//        self.balance = account.balance
//    }
//}
//
//
//class PendingDomainModel {
//    var description, effectiveDate: String?
//    var amount: Double?
//
//    init() {}
//}
//
//extension PendingDomainModel {
//    func transform(pendings: [Pending]) {
//        pendings.forEach { pending in
//            self.description = pending.description
//            self.effectiveDate = pending.effectiveDate
//            self.amount = pending.amount
//        }
//    }
//}
