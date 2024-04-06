//
//  AccountDetailsViewModel.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import Foundation

protocol UserAccountProtocol: AnyObject {
    
    func fetchAccountDetails() -> AccountDomainModel?
    func fetchCompletedTransactionDetails() -> [PendingDomainModel]?
    func fetchPendingTransactionDetails() -> [PendingDomainModel]?
}
