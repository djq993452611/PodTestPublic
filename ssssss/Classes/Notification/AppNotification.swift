
//
//  AppNotification.swift
//  OoProject
//
//  Created by yuxilong on 2022/4/28.
//

import Foundation

/// 应用内通知
public enum AppNotification: String {
   
    ///thirdClass发送到主工程
    case thirdClassToMain
    ///主工程发送到thirdClass
    case mainToThirdClass
    
    ///
    case fourthClassToMain
    
    ///
    case mainToFourthClass
    
}

public extension AppNotification {
    var name: Notification.Name {
        return Notification.Name(self.rawValue + "_Notification")
    }
}
