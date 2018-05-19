//
//  ViewController.swift
//  BothOfUS
//
//  Created by Aravind Durgam on 19/05/18.
//  Copyright © 2018 Aravind. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
     var cameraIDDetails = [CategoryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Traffic Camera List"
        callAPI()
    }
    
    //#Tableview Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cameraIDDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = .disclosureIndicator
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor(red: 0.863, green: 0.863, blue: 0.863, alpha: 1).cgColor
        
        cell.configureCellWith(cameraList: cameraIDDetails[indexPath.row])

        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        var newVC = storyboard?.instantiateViewController(withIdentifier: "CameraDetailViewController") as! CameraDetailViewController
        newVC.cameraObject = cameraIDDetails[indexPath.row]
        
        self.navigationController!.pushViewController(newVC, animated: true)
        
    }
    
    
    
    
    func callAPI()
    {
       
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "b43d202f-69fd-6628-0a43-9b276ce16d63"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://data.goteborg.se/TrafficCamera/v0.1/TrafficCameras/dc858352-3a0b-4ab0-aa45-14e53cef5941?format=json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                
                
                
                do
                    {
                                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                                    print(jsonResponse as! NSMutableArray)
                                    let json = JSON(jsonResponse)
                                    print(json)
                
                
                                    guard let resultData = json.array  else {
                                        print("No category array")
                                        return}
                                    print(resultData)
                                    DispatchQueue.main.async {
                
                
                
                
                                        for data in jsonResponse as! NSArray {
                                            let model = CategoryModel(cameraModel: (data as? NSDictionary)!)
                                            self.cameraIDDetails += [model]
                                        }
                
                
                
                                        self.tblView.reloadData()
                
                                    }
                
                
                
                
                                }catch let error
                                {
                                    print(error)
                                }
                
                
            }
        })
        
        dataTask.resume()
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

