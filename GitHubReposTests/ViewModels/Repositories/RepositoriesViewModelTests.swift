//
//  RepositoriesViewModelTests.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import XCTest
@testable import GitHubRepos

final class RepositoriesViewModelTests: XCTestCase {
    
    private var viewModel: RepositoriesViewModel!
    private var mockRepositoriesRemoteDatasource: MockRepositoriesRemoteDatasource!
    private var mockRepositoriesLocalDatasource: MockRepositoriesLocalDatasource!
    private let mockRepositories: [Repository] = [.testRepository1, .testRepository2]

    @MainActor
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockRepositoriesLocalDatasource = MockRepositoriesLocalDatasource()
        mockRepositoriesRemoteDatasource = MockRepositoriesRemoteDatasource()
        
        viewModel = RepositoriesViewModel(
            remoteDatasource: mockRepositoriesRemoteDatasource,
            localDatasource: mockRepositoriesLocalDatasource
        )
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockRepositoriesLocalDatasource = nil
        mockRepositoriesRemoteDatasource = nil
        try super.tearDownWithError()
    }
    
    @MainActor
    func testGetRepositories() {
        mockRepositoriesLocalDatasource.saveRepositories(mockRepositories)
        
        viewModel.getRepositories()
        
        XCTAssertEqual(viewModel.repositories, mockRepositories, "'viewModel.repositories' should be same as 'mockRepositories'")
        XCTAssertEqual(viewModel.repositories[0].id, mockRepositories[0].id, "'viewModel.repositories[0].id' should be same as 'mockRepositories[0].id'")
    }
    
    @MainActor
    func testSearchRepositoriesSucceeds() async {
        let mockUsersResponse = ItemsResponse(
            totalCount: 2,
            incompleteResults: false,
            items: mockRepositories
        )
        mockRepositoriesRemoteDatasource.repositoriesResponse = mockUsersResponse
        
        await viewModel.searchRepositories(query: "Python")
        
        XCTAssertEqual(viewModel.repositories, mockRepositories, "'viewModel.repositories' should be same as 'mockRepositories'")
        XCTAssertEqual(viewModel.repositories.count, 2, "'viewModel.repositories' should have a count of 2")
        XCTAssertTrue(mockRepositoriesLocalDatasource.getRepositories().isNotEmpty, "repositories cache should not be empty")
    }
    
    @MainActor
    func testSearchUsersThrows() async {
        await viewModel.searchRepositories(query: "Python")
        
        XCTAssertTrue(viewModel.errorMessage.isNotEmpty, "errorMessage should not be empty")
    }
    
    @MainActor
    func testFilterRepositoriesSucceeds() {
        mockRepositoriesLocalDatasource.saveRepositories(mockRepositories)
        viewModel.getRepositories()
        
        viewModel.filterRepositories(text: "Python")
        
        XCTAssertTrue(viewModel.repositories.isNotEmpty, "repositories should not be empty")
        XCTAssertEqual(viewModel.repositories[0].language, "Python", "language should be 'Python'")
    }

}
