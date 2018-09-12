//
//  SubredditCellTableViewCell.swift
//  Reddit_ObjC
//
//  Created by Kamil Wrobel on 9/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class SubredditCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLaberl: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var subredditImageView: UIImageView!
    
    
    var subbredit: KWESubreddit?{
        didSet{
            //check thread
            UpdateViews()
        }
    }
    

    func UpdateViews(){
        guard let subbredit = subbredit else {return}
        titleLaberl.text = subbredit.title
        likeCountLabel.text = "\(subbredit.likeCount)"
        commentCountLabel.text = "\(subbredit.commentCount)"
        imageView?.image = subbredit.photo
    }
    
//    override func prepareForReuse() {
//        <#code#>
//    }

}
