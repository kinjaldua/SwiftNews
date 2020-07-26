//
//  ArticleBodyCell.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-26.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import UIKit

class ArticleBodyCell: UITableViewCell {

    @IBOutlet weak var bodyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with article: Article?) {
        bodyLabel.text = article?.body.convertSpecialCharacters() ?? ""
    }

}
