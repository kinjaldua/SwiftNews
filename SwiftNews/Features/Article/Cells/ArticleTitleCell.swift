//
//  ArticleTitleCell.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-26.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import UIKit

class ArticleTitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    

    func configure(_ title: String){
        titleLabel.text = title
    }

}
