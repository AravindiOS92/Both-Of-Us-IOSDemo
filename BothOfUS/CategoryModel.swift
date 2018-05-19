//
//  CategoryModel.swift
//  BothOfUS
//
//  Created by Aravind Durgam on 19/05/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import Foundation
import SwiftyJSON

class CategoryModel: NSObject {
    
    var descriptionData: String!
    var modeldata: String!
    var ID: Int!
    var secondValue: Int!
    var minuteValue: Int!

    
    override init() {
        super.init()
    }
    
    init(cameraModel: NSDictionary) {
        super.init()
        
        
        if let descriptionData = cameraModel.value(forKey: "Description") as? String {
            self.descriptionData = descriptionData
        }else
        {
            self.descriptionData = ""
        }
        if let modelData = cameraModel.value(forKey: "Model") as? String {
            self.modeldata = modelData
        }else
        {
            self.modeldata = ""
        }
        if let idValue = cameraModel.value(forKey: "ID") as? Int {
            self.ID = idValue
        }
        
        if let secondValue = cameraModel.value(forKey: "CaptureIntervalSeconds") as? Int {
            self.secondValue = secondValue
        }
        if let minuteValue = cameraModel.value(forKey: "StorageDurationMinutes") as? Int {
            self.minuteValue = minuteValue
        }
        
    }

}
