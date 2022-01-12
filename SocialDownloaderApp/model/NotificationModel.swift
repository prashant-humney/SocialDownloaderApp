//
//  NotificationModel.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

struct NotificationModel: Codable {
    var category: NotificationCategoryEnum
    var descriptionItems: [NotificationDescriptionModel]
}

enum NotificationCategoryEnum: Codable {
    case new
    case earlier
    case thisWeek
}
