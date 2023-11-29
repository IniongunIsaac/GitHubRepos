//
//  NetworkServiceTests.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import XCTest
@testable import GitHubRepos

final class NetworkServiceTests: XCTestCase {
    
    private var networkService: NetworkService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let urlSession = URLSession(configuration: .mockDefault)
        networkService = NetworkService(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        networkService = nil
        try super.tearDownWithError()
    }
    
    func testSuccessfulRequest() async {
        MockURLProtocol.data = ResponseData.success
        MockURLProtocol.urlResponse = .withCode(200)
        
        do {
            let response = try await networkService.makeRequest(
                endpoint: .repositories,
                responseType: SuccessTestModel.self
            )
            XCTAssertNotNil(response)
            XCTAssertTrue(response.success)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testRequestFailed() async {
        MockURLProtocol.data = ResponseData.failure
        MockURLProtocol.urlResponse = .withCode(200)
        
        do {
            _ = try await networkService.makeRequest(
                endpoint: .repositories,
                responseType: SuccessTestModel.self
            )
            XCTFail("Expected NetworkError.requestFailed")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.requestFailed)
        }
    }

    func testBadRequest() async {
        MockURLProtocol.data = ResponseData.success
        MockURLProtocol.urlResponse = .withCode(400)
        
        do {
            _ = try await networkService.makeRequest(
                endpoint: .repositories,
                responseType: SuccessTestModel.self
            )
            XCTFail("Expected NetworkError.badRequest")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.badRequest)
        }
    }
    
}

