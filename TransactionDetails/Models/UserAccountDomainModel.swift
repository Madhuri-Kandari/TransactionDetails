//
//  UserAccountDomainModel.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import Foundation

class UserAccountDomainResult {
    var account: AccountDomainModel
    var transactions, pendings: [PendingDomainModel]
    
    init(account: Account, transactions: [Pending], pendings: [Pending]) {
        self.account = AccountDomainModel.init(account: account)
        var trans: [PendingDomainModel] = []
        transactions.forEach({ transaction in
            trans.append(PendingDomainModel.init(pending: transaction))
        })
        self.transactions = trans
        
        var pend: [PendingDomainModel] = []
        pendings.forEach({ pen in
            pend.append(PendingDomainModel.init(pending: pen))
        })
        
        self.pendings = pend
    }
}

class AccountDomainModel {
    var accountName, accountNumber: String?
    var available, balance: Double?
    
    init(account: Account) {
        self.accountName = account.accountName
        self.accountNumber = account.accountNumber
        self.available = account.available
        self.balance = account.balance
    }

}


class PendingDomainModel: Identifiable {
    var description, effectiveDate: String?
    var amount: Double?

    init(pending: Pending) {
        self.description = pending.description
        self.effectiveDate = pending.effectiveDate
        self.amount = pending.amount
    }
}
