//
//  Repository.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import ObjectMapper

class Repository: Mappable {
    var id: Int?
    var nodeId: String?
    var name: String?
    var fullName: String?
    var isPrivate: Bool?
    var owner: UserDetail?
    var htmlUrl: URL?
    var description: String?
    var isFork: Bool?
    var url: URL?
    var forksUrl: URL?
    var keysUrl: URL?
    var collaboratorsUrl: URL?
    var teamsUrl: URL?
    var hooksUrl: URL?
    var issueEventsUrl: URL?
    var eventsUrl: URL?
    var assigneesUrl: URL?
    var branchesUrl: URL?
    var tagsUrl: URL?
    var blobsUrl: URL?
    var gitTagsUrl: URL?
    var gitRefsUrl: URL?
    var treesUrl: URL?
    var statusesUrl: URL?
    var languagesUrl: URL?
    var stargazersUrl: URL?
    var contributorsUrl: URL?
    var subscribersUrl: URL?
    var subscriptionUrl: URL?
    var commitsUrl: URL?
    var gitCommitsUrl: URL?
    var commentsUrl: URL?
    var issueCommentUrl: URL?
    var contentsUrl: URL?
    var compareUrl: URL?
    var mergesUrl: URL?
    var archiveUrl: URL?
    var downloadsUrl: URL?
    var issuesUrl: URL?
    var pullsUrl: URL?
    var milestonesUrl: URL?
    var notificationsUrl: URL?
    var labelsUrl: URL?
    var releasesUrl: URL?
    var deploymentsUrl: URL?
    var createdAt: String?
    var updatedAt: String?
    var pushedAt: String?
    var gitUrl: URL?
    var sshUrl: String?
    var cloneUrl: URL?
    var svnUrl: URL?
    var homepage: String?
    var size: Int?
    var stargazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var hasIssues: Bool?
    var hasProjects: Bool?
    var hasDownloads: Bool?
    var hasWiki: Bool?
    var hasPages: Bool?
    var hasDiscussions: Bool?
    var forksCount: Int?
    var isArchived: Bool?
    var isDisabled: Bool?
    var openIssuesCount: Int?
    var license: String?
    var allowForking: Bool?
    var isTemplate: Bool?
    var webCommitSignoffRequired: Bool?
    var topics: [String]?
    var visibility: String?
    var forks: Int?
    var openIssues: Int?
    var watchers: Int?
    var defaultBranch: String?

    required init?(map: Map) {}
    init() {}

    func mapping(map: Map) {
        id <- map["id"]
        nodeId <- map["node_id"]
        name <- map["name"]
        fullName <- map["full_name"]
        isPrivate <- map["private"]
        owner <- map["owner"]
        htmlUrl <- (map["html_url"], URLTransform())
        description <- map["description"]
        isFork <- map["fork"]
        url <- (map["url"], URLTransform())
        forksUrl <- (map["forks_url"], URLTransform())
        keysUrl <- (map["keys_url"], URLTransform())
        collaboratorsUrl <- (map["collaborators_url"], URLTransform())
        teamsUrl <- (map["teams_url"], URLTransform())
        hooksUrl <- (map["hooks_url"], URLTransform())
        issueEventsUrl <- (map["issue_events_url"], URLTransform())
        eventsUrl <- (map["events_url"], URLTransform())
        assigneesUrl <- (map["assignees_url"], URLTransform())
        branchesUrl <- (map["branches_url"], URLTransform())
        tagsUrl <- (map["tags_url"], URLTransform())
        blobsUrl <- (map["blobs_url"], URLTransform())
        gitTagsUrl <- (map["git_tags_url"], URLTransform())
        gitRefsUrl <- (map["git_refs_url"], URLTransform())
        treesUrl <- (map["trees_url"], URLTransform())
        statusesUrl <- (map["statuses_url"], URLTransform())
        languagesUrl <- (map["languages_url"], URLTransform())
        stargazersUrl <- (map["stargazers_url"], URLTransform())
        contributorsUrl <- (map["contributors_url"], URLTransform())
        subscribersUrl <- (map["subscribers_url"], URLTransform())
        subscriptionUrl <- (map["subscription_url"], URLTransform())
        commitsUrl <- (map["commits_url"], URLTransform())
        gitCommitsUrl <- (map["git_commits_url"], URLTransform())
        commentsUrl <- (map["comments_url"], URLTransform())
        issueCommentUrl <- (map["issue_comment_url"], URLTransform())
        contentsUrl <- (map["contents_url"], URLTransform())
        compareUrl <- (map["compare_url"], URLTransform())
        mergesUrl <- (map["merges_url"], URLTransform())
        archiveUrl <- (map["archive_url"], URLTransform())
        downloadsUrl <- (map["downloads_url"], URLTransform())
        issuesUrl <- (map["issues_url"], URLTransform())
        pullsUrl <- (map["pulls_url"], URLTransform())
        milestonesUrl <- (map["milestones_url"], URLTransform())
        notificationsUrl <- (map["notifications_url"], URLTransform())
        labelsUrl <- (map["labels_url"], URLTransform())
        releasesUrl <- (map["releases_url"], URLTransform())
        deploymentsUrl <- (map["deployments_url"], URLTransform())
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        pushedAt <- map["pushed_at"]
        gitUrl <- (map["git_url"], URLTransform())
        sshUrl <- map["ssh_url"]
        cloneUrl <- (map["clone_url"], URLTransform())
        svnUrl <- (map["svn_url"], URLTransform())
        homepage <- map["homepage"]
        size <- map["size"]
        stargazersCount <- map["stargazers_count"]
        watchersCount <- map["watchers_count"]
        language <- map["language"]
        hasIssues <- map["has_issues"]
        hasProjects <- map["has_projects"]
        hasDownloads <- map["has_downloads"]
        hasWiki <- map["has_wiki"]
        hasPages <- map["has_pages"]
        hasDiscussions <- map["has_discussions"]
        forksCount <- map["forks_count"]
        isArchived <- map["archived"]
        isDisabled <- map["disabled"]
        openIssuesCount <- map["open_issues_count"]
        license <- map["license"]
        allowForking <- map["allow_forking"]
        isTemplate <- map["is_template"]
        webCommitSignoffRequired <- map["web_commit_signoff_required"]
        topics <- map["topics"]
        visibility <- map["visibility"]
        forks <- map["forks"]
        openIssues <- map["open_issues"]
        watchers <- map["watchers"]
        defaultBranch <- map["default_branch"]
    }
}
