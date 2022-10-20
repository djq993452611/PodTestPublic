//
//  JsonTool.swift
//  ssssss
//
//  Created by  jianqi on 2022/10/17.
//

import Foundation
import UIKit
import HandyJSON

class JsonTool: NSObject {
    /**
     *  Json转对象
     *  参数 jsonStr = "{\"id\":12345,\"color\":\"black\",\"name\":\"cat\"}"
     */
    static func jsonToModel(_ jsonStr: String ,_ modelType: HandyJSON.Type) -> BaseModel {
        if jsonStr == "" || jsonStr.count == 0 {
            #if DEBUG
                print("jsonoModel:字符串为空")
            #endif
            return BaseModel()
        }
        return modelType.deserialize(from: jsonStr)  as! BaseModel
        
    }
    
    /**
     *  Json转数组对象
     *  let jsonArrayStr: String = "[{\"name\":\"Bob\",\"id\":\"1\"}, {\"name\":\"Lily\",\"id\":\"2\"}, {\"name\":\"Lucy\",\"id\":\"3\"}]"
     */
    static func jsonArrayToModel(_ jsonArrayStr: String, _ modelType: HandyJSON.Type) ->[BaseModel] {
        if jsonArrayStr == "" || jsonArrayStr.count == 0 {
            #if DEBUG
                print("jsonToModelArray:字符串为空")
            #endif
            return []
        }
        var modelArray: [BaseModel] = []
        let data = jsonArrayStr.data(using: String.Encoding.utf8)
        let peoplesArray = try! JSONSerialization.jsonObject(with:data!, options: JSONSerialization.ReadingOptions()) as? [AnyObject]
        for people in peoplesArray! {
            modelArray.append(dictToModel(people as! [String : Any], modelType))
        }
        return modelArray
        
    }
    
    /**
     *  字典转模型
     */
    static func dictToModel(_ dict: [String: Any], _ modelType: HandyJSON.Type) -> BaseModel {
        if dict.count == 0 {
            #if DEBUG
                print("dictionaryToModel:字符串为空")
            #endif
            return BaseModel()
        }
        return modelType.deserialize(from: dict) as! BaseModel
    }
    /**
     *  模型转字典
     */
    static func modelToDict(_ model:BaseModel?) -> [String: Any] {
        if model == nil {
            #if DEBUG
                print("modelToJson:model为空")
            #endif
            return [:]
        }
        return (model?.toJSON())!
    }
    
    /**
     *  模型转JSON
     */
    static func modelToJson(_ model:BaseModel?) -> String {
        if model == nil {
            #if DEBUG
                print("modelToJson:model为空")
            #endif
             return ""
        }
        return (model?.toJSONString())!
    }
    
}
