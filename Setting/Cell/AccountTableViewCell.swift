//
//  AttributeCellTableViewCell.swift
//  Setting
//
//  Created by Gone on 12/18/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContrainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightChildView: UIView!
    
    lazy var valueLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var item: Account?  {
        didSet {
            titleLabel?.text = item?.key
            
            if titleLabel.text == "Signed In" {
                valueLabel.text = item?.value
            }
            
            if titleLabel.text == "Drive Detection" {
                let switchView = UISwitch(frame: .zero)
                switchView.setOn(false, animated: true)
            
                valueLabel.isHidden = true
                rightChildView.addSubview(switchView)
                accessoryView = switchView
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
