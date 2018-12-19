//
//  ViewController.swift
//  Setting
//
//  Created by Gone on 12/18/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var cateButton: UIBarButtonItem!
    
    fileprivate let viewModel = SettingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupUIs()
        title = "Account Setting"
    }
    
    func register() {
        tableView?.dataSource = viewModel
        tableView.register(AccountTableViewCell.nib, forCellReuseIdentifier: AccountTableViewCell.identifier)
        
        tableView.register(SubscriptionTableViewCell.nib, forCellReuseIdentifier: SubscriptionTableViewCell.identifier)
        
        tableView.register(PersonalTableViewCell.nib, forCellReuseIdentifier: PersonalTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        cateButton = UIBarButtonItem(image: #imageLiteral(resourceName: "btnCategory"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        addLeftBarButtonWithImage(leftButton: cateButton)
    }
    
    func setupUIs () {
        tableView.estimatedRowHeight = 100
        
        tableView.rowHeight = 55
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        setupColor()
    }
    
    func setupColor() {
        view.backgroundColor = UIColor.tableView.mainBackgroundColor
        tableView.backgroundColor = UIColor.tableView.mainBackgroundColor
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.backgroundView?.backgroundColor = UIColor.tableView.mainBackgroundColor
        
        guard let header = view as? UITableViewHeaderFooterView else { fatalError() }
        header.textLabel?.textColor = UIColor.tableView.sectionTitle
//        header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
    }
}
