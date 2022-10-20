//
//  NotifationTool.swift
//  ssssss
//
//  Created by  jianqi on 2022/10/17.
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
