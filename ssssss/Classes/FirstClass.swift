//
//  thiesModelClass.swift
//  ssssss
//
//  Created by  jianqi on 2022/10/12.
//

import Foundation
import RxSwift

public class FirstClass: NSObject {
    //FourthClass实例对象初始化被持有,或者实例方法会释放disposeBag
    var fourthOb = FourthClass()
    
    public static func classMethod() {
        print("FirstClass-外部调用类方法")
    }
    
    public func instanceMetood() {
        print("FirstClass-外部调用实例方法")
        fourthOb.instanceMetood2()
    }
    
}
