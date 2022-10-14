//
//  SecondClass.swift
//  ssssss
//
//  Created by  jianqi on 2022/10/12.
//

import Foundation

public class SecondClass: NSObject {
    
    public static func classMethod() {
        print("SecondClass-外部调用类方法")
        
        ThirdClass.classMethod2()
        let temp = ThirdClass()
        temp.instanceMetood2()
        
        
    }
    
    
}
