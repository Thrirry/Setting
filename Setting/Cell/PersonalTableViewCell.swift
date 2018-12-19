//
//  PersonalTableViewCell.swift
//  Setting
//
//  Created by Gone on 12/19/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContrainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightChildView: UIView!
    var indexPath: String?
    
    lazy var valueLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    lazy var markColorButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var item: Account?  {
        didSet {
            titleLabel?.text = item?.key
            indexPath = item?.row
            
            if indexPath == "0" || indexPath == "2" || indexPath == "4" {
                valueLabel.text = item?.value
                self.accessoryType = .disclosureIndicator
            }
            
            if indexPath == "5" {
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
                
                valueLabel.isHidden = true
                rightChildView.addSubview(switchView)
                accessoryView = switchView
            }
            
            if indexPath == "3" {
                valueLabel.isHidden = true
                setupmarkColorButton()
//                markColorButton.backgroundColor = UIColor(rgb: colors)
            }
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupUI() {
        setupFirstOptionView(mainContrainView: mainContrainView, titleLabel: titleLabel, rightChildView: rightChildView, valueLabel: valueLabel)
    }
    
    func setupmarkColorButton() {
        rightChildView.addSubview(markColorButton)
        markColorButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        markColorButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        markColorButton.rightAnchor.constraint(equalTo: rightChildView.rightAnchor).isActive = true
        markColorButton.centerYAnchor.constraint(equalTo: rightChildView.centerYAnchor).isActive = true
        markColorButton.layer.cornerRadius = 15
        markColorButton.backgroundColor = UIColor.tableView.titleLabel
    }
}
