//
//  BalanceDetailsViewModelTests.swift
//  TransactionDetailsTests
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import XCTest
@testable import TransactionDetails

final class BalanceDetailsViewModelTests: XCTestCase {
    
    var userAccountProtocol: MockUserAccountRepository!
    var sut: BalanceDetailsViewModel?
    
    var failureUserData = UserAccountDataResult(account: Account(accountName: "", accountNumber: "", available: 0.0, balance: 0.0), transactions: [Pending(id: "", description: "", effectiveDate: "", amount: 0.0, atmID: nil)], pending: [Pending(id: "", description: "", effectiveDate: "", amount: 0.0, atmID: nil)], atms: [ATM(id: "", name: "", address: "", location: Location(lat: 0.0, lng: 0.0))])
    
    var successUserData = UserAccountDataResult(account: Account(accountName: "Test", accountNumber: "1234", available: 234.9, balance: 200.3), transactions: [Pending(id: "1", description: "Test Desc", effectiveDate: "12/11/2012", amount: 232.3, atmID: nil)], pending: [Pending(id: "1", description: "Test Desc", effectiveDate: "12/11/2012", amount: 232.3, atmID: nil)], atms: [ATM(id: "Test", name: "Test", address: "Test Address", location: Location(lat: 23.32, lng: 34.44))])

    override func setUpWithError() throws {
        userAccountProtocol = MockUserAccountRepository()
        sut = .init(userAccountRepo: userAccountProtocol)
    }

    override func tearDownWithError() throws {
        userAccountProtocol = nil
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_getAccountName_Success() {
        userAccountProtocol.userAccount = successUserData
        let _ = sut?.getAccountName()
    }
    
    func test_getAccountName_Failure() {
        userAccountProtocol.userAccount = failureUserData
        let _ = sut?.getAccountName()
    }
    
    func test_getAccountNumber_Success() {
        userAccountProtocol.userAccount = successUserData
        let _ = sut?.getAccountNumber()
    }
    
    func test_getAccountNumber_Failure() {
        userAccountProtocol.userAccount = failureUserData
        let _ = sut?.getAccountNumber()
    }
    
    func test_getAvailableFunds_Success() {
        userAccountProtocol.userAccount = successUserData
        let _ = sut?.getAvailableFunds()
    }
    
    func test_getAvailableFunds_Failure() {
        userAccountProtocol.userAccount = failureUserData
        let _ = sut?.getAvailableFunds()
    }
    
    func test_getAvailableBalance_Success() {
        userAccountProtocol.userAccount = successUserData
        let _ = sut?.getAvailableBalance()
    }
    
    func test_getAvailableBalance_Failure() {
        userAccountProtocol.userAccount = failureUserData
        let _ = sut?.getAvailableBalance()
    }
    

}
