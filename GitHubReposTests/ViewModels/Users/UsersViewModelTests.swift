//
//  UsersViewModelTests.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import XCTest
@testable import GitHubRepos

final class UsersViewModelTests: XCTestCase {
    
    private var viewModel: UsersViewModel!
    private var mockUsersLocalDatasource: MockUsersLocalDatasource!
    private var mockUsersRemoteDatasource: MockUsersRemoteDatasource!
    private var mockRepositoriesLocalDatasource: MockRepositoriesLocalDatasource!
    private let mockUsers: [User] = [.testUser1, .testUser2]
    private let mockRepositories: [Repository] = [.testRepository1, .testRepository2]

    @MainActor 
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockUsersLocalDatasource = MockUsersLocalDatasource()
        mockUsersRemoteDatasource = MockUsersRemoteDatasource()
        mockRepositoriesLocalDatasource = MockRepositoriesLocalDatasource()
        
        viewModel = UsersViewModel(
            remoteDatasource: mockUsersRemoteDatasource,
            repositoriesLocalDatasource: mockRepositoriesLocalDatasource,
            usersLocalDatasource: mockUsersLocalDatasource
        )
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockUsersLocalDatasource = nil
        mockUsersRemoteDatasource = nil
        mockRepositoriesLocalDatasource = nil
        try super.tearDownWithError()
    }
    
    @MainActor 
    func testGetUsers() {
        mockUsersLocalDatasource.saveUsers(mockUsers)
        
        viewModel.getUsers()
        
        XCTAssertEqual(viewModel.users, mockUsers, "'viewModel.users' should be same as 'mockUsers'")
    }
    
    @MainActor
    func testFilterUsersSucceeds() {
        mockUsersLocalDatasource.saveUsers(mockUsers)
        viewModel.getUsers()
        
        viewModel.filterUsers(text: "Iniongun")
        
        XCTAssertTrue(viewModel.users.isNotEmpty, "'viewModel.users' should not be empty")
        XCTAssertEqual(viewModel.users[0].name, "Iniongun", "'viewModel.users[0].name' should be 'Iniongun'")
    }
    
    @MainActor
    func testFilterUsersReturnsEmptyResult() {
        mockUsersLocalDatasource.saveUsers(mockUsers)
        viewModel.getUsers()
        
        viewModel.filterUsers(text: "XX")
        
        XCTAssertTrue(viewModel.users.isEmpty, "'viewModel.filterUsers' using an invalid search text should return empty results")
    }
    
    @MainActor
    func testSearchUsersSucceeds() async {
        let mockUsersResponse = ItemsResponse(
            totalCount: 2,
            incompleteResults: false,
            items: mockUsers
        )
        mockUsersRemoteDatasource.usersResponse = mockUsersResponse
        
        await viewModel.searchUsers(query: "Iniongun")
        
        XCTAssertEqual(viewModel.users, mockUsers, "'viewModel.users' should be same as 'mockUsers'")
        XCTAssertEqual(viewModel.users.count, 2, "'viewModel.users' should have a count of 2")
        XCTAssertTrue(mockUsersLocalDatasource.getUsers().isNotEmpty, "users cache should not be empty")
    }
    
    @MainActor
    func testSearchUsersThrows() async {
        await viewModel.searchUsers(query: "Iniongun")
        
        XCTAssertTrue(viewModel.errorMessage.isNotEmpty, "search should return an error message when there's no data")
    }
    
    @MainActor
    func testGetUserAndReposSucceeds() async {
        let mockUser = User.testUser1
        let mockRepositories = [Repository.testRepository1]
        viewModel.user = mockUser
        mockUsersRemoteDatasource.user = mockUser
        mockUsersRemoteDatasource.userRepositories = mockRepositories
        
        await viewModel.getUserAndRepos()
        
        XCTAssertEqual(viewModel.userRepositories, mockRepositories, "userRepositories should be the same as mockRepositories")
        XCTAssertEqual(mockRepositoriesLocalDatasource.getUserRepositories(id: mockUser.id), mockRepositories, "cached userRepositories should be the same as mockRepositories")
        XCTAssertEqual(mockUsersLocalDatasource.getUsers(), [mockUser], "user details should be cached")
    }

}
