//
//  SubscriptionTableViewCell.swift
//  Setting
//
//  Created by Gone on 12/18/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class SubscriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContrainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightChildView: UIView!
    var indexPath: String?
    
    lazy var valueLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    lazy var iconImgView: UIImageView = {
        let imgv = UIImageView()
        return imgv
    }()
    
    var item: Subs?  {
        didSet {
            titleLabel?.text = item?.key
            indexPath = item?.row
            
            if indexPath == "0" {
                uiWithoutIcon()
                iconImgView.isHidden = true
                valueLabel.text = item?.value
            }
            
            if indexPath == "1" || indexPath == "2" {
                uiWithinIcon()
                valueLabel.isHidden = true
                self.accessoryType = .disclosureIndicator
            }
            
            if indexPath == "1" {
                iconImgView.image = UIImage(named: "iconLock")
            }
            
            if indexPath == "2" {
                iconImgView.image = UIImage(named: "iconDollar")
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
        self.contentView.backgroundColor = UIColor.tableView.mainBackgroundColor
        setupSecondOptionView(mainContrainView: mainContrainView, iconImgView: iconImgView, titleLabel: titleLabel, rightChildView: rightChildView, valueLabel: valueLabel)
    }
    
    func uiWithinIcon() {
        titleLabel.textColor = UIColor.tableView.titleLabel
        iconImgView.leftAnchor.constraint(equalTo: mainContrainView.leftAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: iconImgView.rightAnchor, constant: 16).isActive = true
    }
    
    func uiWithoutIcon(){
        titleLabel.leftAnchor.constraint(equalTo: mainContrainView.leftAnchor, constant: 16).isActive = true
    }
}
