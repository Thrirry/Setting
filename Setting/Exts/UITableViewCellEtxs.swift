//
//  UITableViewCell.swift
//  Setting
//
//  Created by Gone on 12/19/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

extension UITableViewCell{
    
    func setupFirstOptionView(mainContrainView: UIView, titleLabel: UILabel, rightChildView: UIView, valueLabel: UILabel) {
        
        mainContrainView.translatesAutoresizingMaskIntoConstraints = false
        mainContrainView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
        mainContrainView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        mainContrainView.backgroundColor = UIColor.white

        mainContrainView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: mainContrainView.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: mainContrainView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: mainContrainView.bottomAnchor).isActive = true
        
        mainContrainView.addSubview(rightChildView)
        rightChildView.translatesAutoresizingMaskIntoConstraints = false
        rightChildView.rightAnchor.constraint(equalTo: mainContrainView.rightAnchor, constant: -16).isActive = true
        rightChildView.topAnchor.constraint(equalTo: mainContrainView.topAnchor).isActive = true
        rightChildView.bottomAnchor.constraint(equalTo: mainContrainView.bottomAnchor).isActive = true
        rightChildView.leftAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        rightChildView.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.centerXAnchor.constraint(equalTo: rightChildView.centerXAnchor).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor).isActive = true
        valueLabel.heightAnchor.constraint(equalTo: rightChildView.heightAnchor).isActive = true
        valueLabel.widthAnchor.constraint(equalTo: rightChildView.widthAnchor).isActive = true
        valueLabel.textAlignment = .right
    }
    
    func setupSecondOptionView(mainContrainView: UIView, iconImgView: UIImageView, titleLabel: UILabel, rightChildView: UIView, valueLabel: UILabel) {
        
        mainContrainView.translatesAutoresizingMaskIntoConstraints = false
        mainContrainView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
        mainContrainView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        mainContrainView.backgroundColor = UIColor.white
        
        mainContrainView.addSubview(iconImgView)
        iconImgView.translatesAutoresizingMaskIntoConstraints = false
        iconImgView.contentMode = .scaleAspectFit

        iconImgView.widthAnchor.constraint(equalToConstant: 13).isActive = true
        iconImgView.topAnchor.constraint(equalTo: mainContrainView.topAnchor, constant: 16).isActive = true
        iconImgView.bottomAnchor.constraint(equalTo: mainContrainView.bottomAnchor, constant: -16).isActive = true
        
        mainContrainView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: mainContrainView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: mainContrainView.bottomAnchor).isActive = true

        mainContrainView.addSubview(rightChildView)
        rightChildView.translatesAutoresizingMaskIntoConstraints = false
        rightChildView.rightAnchor.constraint(equalTo: mainContrainView.rightAnchor, constant: -16).isActive = true
        rightChildView.topAnchor.constraint(equalTo: mainContrainView.topAnchor).isActive = true
        rightChildView.bottomAnchor.constraint(equalTo: mainContrainView.bottomAnchor).isActive = true
        rightChildView.leftAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        rightChildView.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.centerXAnchor.constraint(equalTo: rightChildView.centerXAnchor).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor).isActive = true
        valueLabel.heightAnchor.constraint(equalTo: rightChildView.heightAnchor).isActive = true
        valueLabel.widthAnchor.constraint(equalTo: rightChildView.widthAnchor).isActive = true
        valueLabel.textAlignment = .right
    }
}
