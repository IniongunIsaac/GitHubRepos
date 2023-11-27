//
//  Repository.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 27/11/2023.
//

import Foundation

struct Repository: Codable, Identifiable {
    let id: Int?
    let nodeID, name, fullName: String?
    let owner: Owner?
    let itemPrivate: Bool?
    let htmlURL: String?
    let description: String?
    let fork: Bool?
    let url: String?
    let createdAt, updatedAt, pushedAt: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: String?
    let forksCount, openIssuesCount: Int?
    let masterBranch, defaultBranch: String?
    let score: Int?
    let archiveURL, assigneesURL, blobsURL, branchesURL: String?
    let collaboratorsURL, commentsURL, commitsURL, compareURL: String?
    let contentsURL: String?
    let contributorsURL, deploymentsURL, downloadsURL, eventsURL: String?
    let forksURL: String?
    let gitCommitsURL, gitRefsURL, gitTagsURL, gitURL: String?
    let issueCommentURL, issueEventsURL, issuesURL, keysURL: String?
    let labelsURL: String?
    let languagesURL, mergesURL: String?
    let milestonesURL, notificationsURL, pullsURL, releasesURL: String?
    let sshURL: String?
    let stargazersURL: String?
    let statusesURL: String?
    let subscribersURL, subscriptionURL, tagsURL, teamsURL: String?
    let treesURL: String?
    let cloneURL: String?
    let mirrorURL: String?
    let hooksURL, svnURL: String?
    let forks, openIssues, watchers: Int?
    let hasIssues, hasProjects, hasPages, hasWiki: Bool?
    let hasDownloads, archived, disabled: Bool?
    let visibility: String?
    let license: License?
    let topics: [String]?
    
    var hasTopics: Bool {
        (topics ?? []).isNotEmpty
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case itemPrivate = "private"
        case htmlURL = "html_url"
        case description, fork, url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case masterBranch = "master_branch"
        case defaultBranch = "default_branch"
        case score
        case archiveURL = "archive_url"
        case assigneesURL = "assignees_url"
        case blobsURL = "blobs_url"
        case branchesURL = "branches_url"
        case collaboratorsURL = "collaborators_url"
        case commentsURL = "comments_url"
        case commitsURL = "commits_url"
        case compareURL = "compare_url"
        case contentsURL = "contents_url"
        case contributorsURL = "contributors_url"
        case deploymentsURL = "deployments_url"
        case downloadsURL = "downloads_url"
        case eventsURL = "events_url"
        case forksURL = "forks_url"
        case gitCommitsURL = "git_commits_url"
        case gitRefsURL = "git_refs_url"
        case gitTagsURL = "git_tags_url"
        case gitURL = "git_url"
        case issueCommentURL = "issue_comment_url"
        case issueEventsURL = "issue_events_url"
        case issuesURL = "issues_url"
        case keysURL = "keys_url"
        case labelsURL = "labels_url"
        case languagesURL = "languages_url"
        case mergesURL = "merges_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case pullsURL = "pulls_url"
        case releasesURL = "releases_url"
        case sshURL = "ssh_url"
        case stargazersURL = "stargazers_url"
        case statusesURL = "statuses_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case tagsURL = "tags_url"
        case teamsURL = "teams_url"
        case treesURL = "trees_url"
        case cloneURL = "clone_url"
        case mirrorURL = "mirror_url"
        case hooksURL = "hooks_url"
        case svnURL = "svn_url"
        case forks
        case openIssues = "open_issues"
        case watchers
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasPages = "has_pages"
        case hasWiki = "has_wiki"
        case hasDownloads = "has_downloads"
        case archived, disabled, visibility, license
        case topics
    }
}

//extension Repository {
//    static let dummy = Repository(id: <#T##Int?#>, nodeID: <#T##String?#>, name: <#T##String?#>, fullName: <#T##String?#>, owner: <#T##Owner?#>, itemPrivate: <#T##Bool?#>, htmlURL: <#T##String?#>, description: <#T##String?#>, fork: <#T##Bool?#>, url: <#T##String?#>, createdAt: <#T##Date?#>, updatedAt: <#T##Date?#>, pushedAt: <#T##Date?#>, homepage: <#T##String?#>, size: <#T##Int?#>, stargazersCount: <#T##Int?#>, watchersCount: <#T##Int?#>, language: <#T##String?#>, forksCount: <#T##Int?#>, openIssuesCount: <#T##Int?#>, masterBranch: <#T##String?#>, defaultBranch: <#T##String?#>, score: <#T##Int?#>, archiveURL: <#T##String?#>, assigneesURL: <#T##String?#>, blobsURL: <#T##String?#>, branchesURL: <#T##String?#>, collaboratorsURL: <#T##String?#>, commentsURL: <#T##String?#>, commitsURL: <#T##String?#>, compareURL: <#T##String?#>, contentsURL: <#T##String?#>, contributorsURL: <#T##String?#>, deploymentsURL: <#T##String?#>, downloadsURL: <#T##String?#>, eventsURL: <#T##String?#>, forksURL: <#T##String?#>, gitCommitsURL: <#T##String?#>, gitRefsURL: <#T##String?#>, gitTagsURL: <#T##String?#>, gitURL: <#T##String?#>, issueCommentURL: <#T##String?#>, issueEventsURL: <#T##String?#>, issuesURL: <#T##String?#>, keysURL: <#T##String?#>, labelsURL: <#T##String?#>, languagesURL: <#T##String?#>, mergesURL: <#T##String?#>, milestonesURL: <#T##String?#>, notificationsURL: <#T##String?#>, pullsURL: <#T##String?#>, releasesURL: <#T##String?#>, sshURL: <#T##String?#>, stargazersURL: <#T##String?#>, statusesURL: <#T##String?#>, subscribersURL: <#T##String?#>, subscriptionURL: <#T##String?#>, tagsURL: <#T##String?#>, teamsURL: <#T##String?#>, treesURL: <#T##String?#>, cloneURL: <#T##String?#>, mirrorURL: <#T##String?#>, hooksURL: <#T##String?#>, svnURL: <#T##String?#>, forks: <#T##Int?#>, openIssues: <#T##Int?#>, watchers: <#T##Int?#>, hasIssues: <#T##Bool?#>, hasProjects: <#T##Bool?#>, hasPages: <#T##Bool?#>, hasWiki: <#T##Bool?#>, hasDownloads: <#T##Bool?#>, archived: <#T##Bool?#>, disabled: <#T##Bool?#>, visibility: <#T##String?#>, license: <#T##License?#>, topics: <#T##[String]?#>)
//}
