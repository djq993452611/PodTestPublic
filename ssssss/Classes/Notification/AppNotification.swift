
//
//  AppNotification.swift
//  OoProject
//
//  Created by yuxilong on 2022/4/28.
//

import Foundation
import RxSwift
import RxCocoa

public class NotificationTool: NSObject {
    /// 发送通知
    /// - Parameters:
    ///   - name: 通知名称
    ///   - object: 通知携带的对象
    public static func post(_ notification: AppNotification, object: Any? = nil) {
        NotificationCenter.default.post(name: notification.name, object: object)
    }

    /// 监听通知
    /// - Parameter name: 通知名称
    /// - Returns: 可订阅通知处理
    public static func observer(_ notification: AppNotification) -> Observable<Notification> {
        return NotificationCenter.default.rx.notification(notification.name)
    }
    
}


/// 应用内通知
public enum AppNotification: String {
    /// 融云数据库连接成功
    case rcOpenSuccess
    
    case rcOpenFailed
    
    /// 融云服务器连接失败
    case rcConnectFailed
    
    /// 连接成功
    case rcConnectSucceed
    
}

public extension AppNotification {
    var name: Notification.Name {
        return Notification.Name(self.rawValue + "_Notification")
    }
}
