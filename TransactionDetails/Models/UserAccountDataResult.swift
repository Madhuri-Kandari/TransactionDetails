//
//  TransactionResult.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import Foundation

import Foundation

// MARK: - Welcome
struct UserAccountDataResult: Decodable {
    let account: Account
    let transactions, pending: [Pending]
    let atms: [ATM]
}

// MARK: - Account
struct Account: Decodable {
    let accountName, accountNumber: String
    let available, balance: Double
}

// MARK: - ATM
struct ATM: Decodable {
    let id, name, address: String
    let location: Location
}

// MARK: - Location
struct Location: Decodable {
    let lat, lng: Double
}

// MARK: - Pending
struct Pending: Decodable, Identifiable {
    let id, description, effectiveDate: String
    let amount: Double
    let atmID: String?

    enum CodingKeys: String, CodingKey {
        case id, description, effectiveDate, amount
        case atmID = "atmId"
    }
}
