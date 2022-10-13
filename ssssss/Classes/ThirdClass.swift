//
//  ThirdClass.swift
//  ssssss
//
//  Created by  jianqi on 2022/10/12.
//

import Foundation

public class ThirdClass: NSObject {
    
    func lllllll(){
        print("ThirdClass内部调用实例方法")
    }
    
    static func ttttttt() {
        print("ThirdClass内部调用类方法")
    }
    
    public static func hhhhhh() {
        print("ThirdClass外部调用类方法")
    }
    
    
}
