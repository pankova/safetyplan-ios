//
//  ButtonCell.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/14/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class ButtonCell: BaseTableViewCell {
    
    private var button = UIButton()
    var buttonTitle: String = "" {
        didSet {
            self.button.setTitle(self.buttonTitle, for: .normal)
        }
    }
    var onTapCompletion: (() -> ())?
    
    override func commonInit() {
        super.commonInit()
        
        self.contentView.addSubview(self.button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.addTarget(self, action: #selector(onTap), for: .primaryActionTriggered)
        self.button.setTitleColor(.appBlue, for: .normal)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            button.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            button.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
        ])
    }
    
    @objc private func onTap() {
        self.onTapCompletion?()
    }
}
