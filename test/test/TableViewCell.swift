//
//  TableViewCell.swift
//  test
//
//  Created by OUT-Korogodova-MM on 02.09.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    var data: DemoData? {
        didSet {
            nameLabel.text = data?.title
            explanLabel.text = data?.explanation
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var explanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontSizeToFitWidth = true
//        explanLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
