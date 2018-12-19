//
//  AccountViewModel.swift
//  Setting
//
//  Created by Gone on 12/18/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import Foundation

enum SettingViewModelItemType {
    case account
    case subscription
    case personalization
}

protocol SettingViewModelItem {
    var type: SettingViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class SettingViewModel: NSObject {
    var items = [SettingViewModelItem]()
    
    override init() {
        super.init()
        guard let data = dataFromFile("ServerData"), let setting = Setting(data: data) else {
            return
        }
     
        let accounts = setting.account
        if !accounts.isEmpty {
            let accountsItem = AccountViewModeItem(accounts: accounts)
            items.append(accountsItem)
        }
        
        let subs = setting.sub
        if !subs.isEmpty {
            let subsItem = SubSViewModeItem(subs: subs)
            items.append(subsItem)
        }
        
        let personal = setting.personalization
        if !personal.isEmpty {
            let persItem = PersonalViewModeItem(pers: personal)
            items.append(persItem)
        }

    }
}

extension SettingViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {

        case .account:
            if let item = item as? AccountViewModeItem, let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifier, for: indexPath) as? AccountTableViewCell {
                
                cell.item = item.accounts[indexPath.row]
                
                return cell
            }
            
        case .subscription:
            if let item = item as? SubSViewModeItem, let cell = tableView.dequeueReusableCell(withIdentifier: SubscriptionTableViewCell.identifier, for: indexPath) as? SubscriptionTableViewCell {
                
                cell.item = item.subs[indexPath.row]
                
                return cell
            }
        
        case .personalization:
            if let item = item as? PersonalViewModeItem, let cell = tableView.dequeueReusableCell(withIdentifier: PersonalTableViewCell.identifier, for: indexPath) as? PersonalTableViewCell {
                
                cell.item = item.per[indexPath.row]
                
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}

class AccountViewModeItem: SettingViewModelItem {
    var type: SettingViewModelItemType {
        return .account
    }
    
    var sectionTitle: String {
        return "Account"
    }
    
    var rowCount: Int {
        return accounts.count
    }
    
    var accounts: [Account]
    
    init(accounts: [Account]) {
        self.accounts = accounts
    }
}

class SubSViewModeItem: SettingViewModelItem {
    var type: SettingViewModelItemType {
        return .subscription
    }
    
    var sectionTitle: String {
        return "Subscription"
    }
    
    var rowCount: Int {
        return subs.count
    }
    
    var subs: [Subs]
    
    init(subs: [Subs]) {
        self.subs = subs
    }
}

class PersonalViewModeItem: SettingViewModelItem {
    var type: SettingViewModelItemType {
        return .personalization
    }
    
    var sectionTitle: String {
        return "Personalization"
    }
    
    var per: [Personalization]
    
    var rowCount: Int {
        return per.count
    }
    
    init(pers: [Personalization]) {
        self.per = pers
    }
}

