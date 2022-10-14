//
//  FourthClass.swift
//  ssssss
//
//  Created by  jianqi on 2022/10/14.
//

import Foundation
import Foundation
import RxSwift

public class FourthClass: NSObject {

    private var disposeBag = DisposeBag()
    
    func instanceMetood2() {
        print("FourthClass-内部调用实例方法")
        //disposeBag在实例方法结束后自动释放，需要FourthClass实例对象初始化被持有
        NotificationTool.observer(.rcConnectFailed).subscribe(onNext: {  _ in
            print("FourthClass监听到主工程发送通知")
        }).disposed(by: disposeBag)
        NotificationTool.post(.rcConnectSucceed)
    }

}
