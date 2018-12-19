//
//  OrtherTableViewCell.swift
//  Setting
//
//  Created by Gone on 12/19/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class OtherTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContrainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightChildView: UIView!
    
    var indexPath: String?
    
    lazy var valueLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var item: Account?  {
        didSet {
            titleLabel?.text = item?.key
            indexPath = item?.row
            
            if indexPath == "0"{
                valueLabel.isHidden = true
                self.accessoryType = .disclosureIndicator
            }
            
            if indexPath == "1" {
               valueLabel.text = item?.value
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
}
