//
//  AppDelegate.swift
//  ssssss
//
//  Created by JianQi on 10/12/2022.
//  Copyright (c) 2022 JianQi. All rights reserved.
//

import UIKit
import ssssss
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let firstOb = FirstClass()
    let thirdOb = ThirdClass()
    
    private var disposeBag = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirstClass.classMethod()
        SecondClass.classMethod()
        ThirdClass.classMethod()
        
        //主工程和ThirdClass互发通知
        NotificationTool.observer(.rcOpenSuccess).subscribe(onNext: {  _ in
            print("主工程监监听到ThirdClass发送通知")
        }).disposed(by: disposeBag)
        thirdOb.instanceMetood()
        NotificationTool.post(.rcOpenFailed)
        
        //主工程和FourthClass互发通知，中间媒介FirstClass
        NotificationTool.observer(.rcConnectSucceed).subscribe(onNext: {  _ in
            print("主工程监听到FourthClass发送通知")
        }).disposed(by: disposeBag)
        firstOb.instanceMetood()
        NotificationTool.post(.rcConnectFailed)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

