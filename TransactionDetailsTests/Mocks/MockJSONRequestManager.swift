//
//  MockJSONRequestManager.swift
//  TransactionDetailsTests
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import Foundation
@testable import TransactionDetails

class MockJSONRequestManager: JSONRequestProtocol {
    
    var fileName = "Test"
    
    func load<T>(_ filename: String) -> T where T : Decodable {
        let data: Data

        guard let file = Bundle.main.url(forResource: fileName, withExtension: "json")
            else {
                fatalError("Couldn't find \(fileName) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
        }
    }
}
