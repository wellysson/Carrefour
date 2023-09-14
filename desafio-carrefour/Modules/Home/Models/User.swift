//
//  User.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var login: String?
    var id: Int?
    var nodeId: String?
    var avatarUrl: URL?
    var gravatarId: String?
    var url: URL?
    var htmlUrl: URL?
    var followersUrl: URL?
    var followingUrl: String?
    var gistsUrl: String?
    var starredUrl: String?
    var subscriptionsUrl: URL?
    var organizationsUrl: URL?
    var reposUrl: URL?
    var eventsUrl: String?
    var receivedEventsUrl: String?
    var type: String?
    var siteAdmin: Bool?

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
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- (map["subscriptions_url"], URLTransform())
        organizationsUrl <- (map["organizations_url"], URLTransform())
        reposUrl <- (map["repos_url"], URLTransform())
        eventsUrl <- map["events_url"]
        receivedEventsUrl <- map["received_events_url"]
        type <- map["type"]
        siteAdmin <- map["site_admin"]
    }
}
