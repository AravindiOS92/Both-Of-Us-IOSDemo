//
//  CustomTableViewCell.swift
//  BothOfUS
//
//  Created by Aravind Durgam on 19/05/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var modelLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCellWith(cameraList:CategoryModel){
        
        
        self.descriptionLBL.text = cameraList.descriptionData
        self.modelLBL.text = cameraList.modeldata
        
        
        
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
