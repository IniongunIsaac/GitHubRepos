//
//  UsersViewModelTests.swift
//  GitHubReposTests
//
//  Created by Isaac Iniongun on 28/11/2023.
//

import XCTest
@testable import GitHubRepos

final class UsersViewModelTests: XCTestCase {
    
    var usersViewModel: UsersViewModel!
    var mockUsersLocalDatasource: MockUsersLocalDatasource!
    var mockUsersRemoteDatasource: MockUsersRemoteDatasource!
    var mockRepositoriesLocalDatasource: MockRepositoriesLocalDatasource!
    private let mockUsers: [User] = [.testUser1, .testUser2]
    private let mockRepositories: [Repository] = [.testRepository1, .testRepository2]

    @MainActor 
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUsersLocalDatasource = MockUsersLocalDatasource()
        mockUsersRemoteDatasource = MockUsersRemoteDatasource()
        mockRepositoriesLocalDatasource = MockRepositoriesLocalDatasource()
        
        usersViewModel = UsersViewModel(
            remoteDatasource: mockUsersRemoteDatasource,
            repositoriesLocalDatasource: mockRepositoriesLocalDatasource,
            usersLocalDatasource: mockUsersLocalDatasource
        )
    }

    override func tearDownWithError() throws {
        usersViewModel = nil
        mockUsersLocalDatasource = nil
        mockUsersRemoteDatasource = nil
        mockRepositoriesLocalDatasource = nil
        try super.tearDownWithError()
    }
    
    @MainActor 
    func testGetUsers() {
        mockUsersLocalDatasource.saveUsers(mockUsers)
        
        usersViewModel.getUsers()
        
        XCTAssertEqual(usersViewModel.users, mockUsers)
    }
    
    @MainActor
    func testFilterUsersSucceeds() {
        mockUsersLocalDatasource.saveUsers(mockUsers)
        usersViewModel.getUsers()
        
        usersViewModel.filterUsers(text: "Iniongun")
        
        XCTAssertTrue(usersViewModel.users.isNotEmpty)
        XCTAssertEqual(usersViewModel.users[0].name, "Iniongun")
    }
    
    @MainActor
    func testFilterUsersReturnsEmptyResult() {
        mockUsersLocalDatasource.saveUsers(mockUsers)
        usersViewModel.getUsers()
        
        usersViewModel.filterUsers(text: "XX")
        
        XCTAssertTrue(usersViewModel.users.isEmpty)
    }
    
    @MainActor
    func testSearchUsersSucceeds() async {
        let mockUsersResponse = ItemsResponse(
            totalCount: 2,
            incompleteResults: false,
            items: mockUsers
        )
        mockUsersRemoteDatasource.usersResponse = mockUsersResponse
        
        await usersViewModel.searchUsers(query: "Iniongun")
        
        XCTAssertEqual(usersViewModel.users, mockUsers)
        XCTAssertEqual(usersViewModel.users.count, 2)
        XCTAssertTrue(mockUsersLocalDatasource.getUsers().isNotEmpty)
    }
    
    @MainActor
    func testSearchUsersThrows() async {
        await usersViewModel.searchUsers(query: "Iniongun")
        
        XCTAssertTrue(usersViewModel.errorMessage.isNotEmpty)
    }
    
    @MainActor
    func testGetUserAndReposSucceeds() async {
        let mockUser = User.testUser1
        let mockRepositories = [Repository.testRepository1]
        usersViewModel.user = mockUser
        mockUsersRemoteDatasource.user = mockUser
        mockUsersRemoteDatasource.userRepositories = mockRepositories
        
        await usersViewModel.getUserAndRepos()
        
        XCTAssertEqual(usersViewModel.userRepositories, mockRepositories)
        XCTAssertEqual(mockRepositoriesLocalDatasource.getUserRepositories(id: mockUser.id), mockRepositories)
        XCTAssertEqual(mockUsersLocalDatasource.getUsers(), [mockUser])
    }

}
