//
//  NotificationDescriptionModel.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

struct NotificationDescriptionModel: Codable {
    var imageName: String // This is suppose to be URL String instead of image name String. Have to change once local server is set up.
    var friendName: String
    var notificationDescription: String
    var timeElapsed: String // I feel this should be calculated on the client side once the notification is received. This means if the user has not interacted with it, this should move automatically to different sub categories like Earlier, This Week, Last Week etc.
}
