//
//  WalletCell.swift
//  Uallet
//
//  Created by Flaminia Castaño on 05/04/2022.
//

import UIKit

class WalletCell: UITableViewCell {

    
    @IBOutlet weak var nombreWallet: UILabel!
    @IBOutlet weak var moneda: UILabel!
    @IBOutlet weak var monto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
