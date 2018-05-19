//
//  CameraDetailViewController.swift
//  BothOfUS
//
//  Created by Aravind Durgam on 19/05/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit

class CameraDetailViewController: UIViewController {
    
    var cameraObject = CategoryModel()

    @IBOutlet weak var modelLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var minutesLBL: UILabel!
    @IBOutlet weak var secondsLBL: UILabel!
    
    
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         self.title = "Camera Details"
        
        self.descriptionLBL.text = cameraObject.descriptionData
        self.modelLBL.text = cameraObject.modeldata
        self.secondsLBL.text = "StorageDurationMinutes " + "\(cameraObject.secondValue!)"
        self.minutesLBL.text = "CaptureIntervalSeconds " + "\(cameraObject.minuteValue!)"

        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let imageUrlString = "http://data.goteborg.se/TrafficCamera/v0.1/CameraImage/dc858352-3a0b-4ab0-aa45-14e53cef5941/\(cameraObject.ID!)"
        //        let imageUrl:URL = URL(string: imageUrlString)!
        //        let imageData:NSData = NSData(contentsOf: imageUrl)!
        //        let image = UIImage(data: imageData as Data)
        //        imgView.image = image
        //        imgView.contentMode = UIViewContentMode.scaleAspectFit
        //
        
        
        if let url = URL(string: imageUrlString)
        {
            do
            {
                let data = try Data(contentsOf: url)
                
                self.imgView.image = UIImage(data: data)
            }catch let err
            {
                print("Error \(err.localizedDescription)")
            }
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
