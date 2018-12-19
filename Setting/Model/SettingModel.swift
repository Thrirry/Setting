//
//  AccountModel.swift
//  Setting
//
//  Created by Gone on 12/18/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import Foundation

public func dataFromFile(_ filename: String) -> Data? {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
    }
    return nil
}

class Setting {

    var account = [Account]()
    var sub = [Subs]()
    var personalization = [Personalization]()
    var othersetting = [OtherSetting]()
    
    init?(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any], let body = json["setting"] as? [String: Any] {

                if let accounts = body["account"] as? [[String: Any]] {
                    self.account = accounts.map { Account(json: $0) }
                }
                
                if let subs = body["subscription"] as? [[String: Any]] {
                    self.sub = subs.map { Subs(json: $0) }
                }
                
                if let personal = body["personalization"] as? [[String: Any]] {
                    self.personalization = personal.map { Personalization(json: $0) }
                }
                
                if let otherSetting = body["otherSetting"] as? [[String: Any]] {
                    self.othersetting = otherSetting.map { OtherSetting(json: $0) }
                }
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
    }
}

class Account {
    var row: String?
    var key: String?
    var value: String?
    
    init(json: [String: Any]) {
        self.row = json["row"] as? String
        self.key = json["key"] as? String
        self.value = json["value"] as? String
    }
}

class Subs: Account {}

class Personalization: Account {}

class OtherSetting: Account {}
