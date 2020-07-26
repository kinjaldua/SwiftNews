//
//  ArticleImageCell.swift
//  SwiftNews
//
//  Created by Dua, Kinjal on 2020-07-26.
//  Copyright © 2020 Dua, Kinjal. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleImageCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var thumbnailHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    
    func configure(_ article: Article?)  {
        if let article = article, let image = article.largeImage, let url = image.url{
            let str = url.convertSpecialCharacters()
            calculateImageHeight()
            thumbnailImageView.sd_setImage(with: URL(string: str), placeholderImage: nil)
            layoutIfNeeded()
        } else {
            thumbnailHeightConstraint.constant = 0
        }
    }
    
    func calculateImageHeight() {
        
        let ratio = 1.66 //Double(width / height)
        let w = Double(thumbnailImageView.frame.size.width)
        let newHeight = w / ratio
        thumbnailHeightConstraint.constant = CGFloat(newHeight)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        calculateImageHeight()
    }
}
