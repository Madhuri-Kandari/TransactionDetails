//
//  ServiceRequestProtocol.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 03/04/24.
//

import Foundation

protocol JSONRequestProtocol {
    func load<T: Decodable>(_ filename: String) -> T
}
