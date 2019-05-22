//
//  MovieCell.swift
//  DunyangN U2A1Q1
//
//  Created by Jessica Li on 2019-04-06.
//  Copyright © 2019 Dunyang Ni. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
