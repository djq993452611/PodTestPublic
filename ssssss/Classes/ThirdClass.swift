//
//  ThirdClass.swift
//  ssssss
//
//  Created by  jianqi on 2022/10/12.
//

import Foundation
import RxSwift

public class ThirdClass: NSObject {
    
    private var disposeBag = DisposeBag()
    
    public static func classMethod() {
        print("ThirdClass-外部调用类方法")
    }
    
    public func instanceMetood() {
        print("ThirdClass-外部调用实例方法")
        
        NotificationTool.observer(.mainToThirdClass).subscribe(onNext: {  _ in
            print("ThirdClass监听到主工程发送通知")
        }).disposed(by: disposeBag)
        
        NotificationTool.post(.thirdClassToMain)
    }
    
    static func classMethod2() {
        print("ThirdClass-内部调用类方法")
    }
    
    func instanceMetood2() {
        print("ThirdClass-内部调用实例方法")
        
    }
    
}
