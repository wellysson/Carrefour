//
//  UserDetail.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import ObjectMapper

class UserDetail: Mappable {
    var login: String?
    var id: Int?
    var nodeId: String?
    var avatarUrl: URL?
    var gravatarId: String?
    var url: URL?
    var htmlUrl: URL?
    var followersUrl: URL?
    var followingUrl: URL?
    var gistsUrl: URL?
    var starredUrl: URL?
    var subscriptionsUrl: URL?
    var organizationsUrl: URL?
    var reposUrl: URL?
    var eventsUrl: URL?
    var receivedEventsUrl: URL?
    var type: String?
    var siteAdmin: Bool?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: Bool?
    var bio: String?
    var twitterUsername: String?
    var publicRepos: Int?
    var publicGists: Int?
    var followers: Int?
    var following: Int?
    var createdAt: String?
    var updatedAt: String?

    required init?(map: Map) {}

    func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        nodeId <- map["node_id"]
        avatarUrl <- (map["avatar_url"], URLTransform())
        gravatarId <- map["gravatar_id"]
        url <- (map["url"], URLTransform())
        htmlUrl <- (map["html_url"], URLTransform())
        followersUrl <- (map["followers_url"], URLTransform())
        followingUrl <- (map["following_url"], URLTransform())
        gistsUrl <- (map["gists_url"], URLTransform())
        starredUrl <- (map["starred_url"], URLTransform())
        subscriptionsUrl <- (map["subscriptions_url"], URLTransform())
        organizationsUrl <- (map["organizations_url"], URLTransform())
        reposUrl <- (map["repos_url"], URLTransform())
        eventsUrl <- (map["events_url"], URLTransform())
        receivedEventsUrl <- (map["received_events_url"], URLTransform())
        type <- map["type"]
        siteAdmin <- map["site_admin"]
        name <- map["name"]
        company <- map["company"]
        blog <- map["blog"]
        location <- map["location"]
        email <- map["email"]
        hireable <- map["hireable"]
        bio <- map["bio"]
        twitterUsername <- map["twitter_username"]
        publicRepos <- map["public_repos"]
        publicGists <- map["public_gists"]
        followers <- map["followers"]
        following <- map["following"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
    }
}
