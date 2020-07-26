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

    
    func configure(with article: Article?) {
        if !(article?.body.isEmpty ?? false) {
            bodyLabel.text = article?.body.convertSpecialCharacters() ?? ""
        } else {
            bodyLabel.text = article?.contentUrl ?? ""
        }
    }
    
    func openUrl(){
        if  canVerifyUrl(), let url = URL(string: bodyLabel.text ?? "") {
            return UIApplication.shared.open(url)
        }
    }
    
    func canVerifyUrl() -> Bool {
        guard let urlString = bodyLabel.text,
              let url = URL(string: urlString) else {
            return false
        }
        return UIApplication.shared.canOpenURL(url)
    }

}
