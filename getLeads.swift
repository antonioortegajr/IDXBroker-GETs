//
//  getLeads.swift
//  IDX_Broker
//
//  Created by Ryan Hubbard on 3/31/17.
//  Copyright © 2017 Ryan Hubbard. All rights reserved.
//

import Foundation


class getLeads {
    
    final let urlString = "https://api.idxbroker.com/leads/lead"
    
    //Arrays to store data
    var address = [String]()
    var agentOwner = [Int]()
    var canLogin = [String]()
    var city = [String]()
    var country = [String]()
    var customRegistrationFields = [String]()
    var disabled = [String]()
    var email = [String]()
    var email2 = [String]()
    var firstName = [String]()
    var id = [Int]()
    var lastActivityDate = [String]()
    var lastEdited = [String]()
    var lastName = [String]()
    var phone = [String]()
    var receiveUpdates = [String]()
    var savedProperties = [Int]()
    var savedSearches = [Int]()
    var stateProvince = [String]()
    var subscribeDate = [String]()
    var zipCode = [Int]()

    

    func downloadLeads() {
        
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as URL?)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        /******************** Add Headers required for API CALL *************************************/
        downloadTask.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        downloadTask.setValue("your-access-key", forHTTPHeaderField: "accesskey")
        downloadTask.setValue("json", forHTTPHeaderField: "outputtype")
        
        downloadTask.httpMethod = "GET"
        /******************** End Headers required for API CALL *************************************/
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
            
            
           print(jsonData ?? "Default")    //  Debug Print JSON
            
            /******** Parse JSON **********/
            let meCount = Int((jsonData?.count)!) - 1; //get number to use for our loop
            
            for index in 0...meCount {
                let myLine = jsonData?[index] as! [String:Any];//break down particular line and display to screen
                self.address.append(myLine["address"]! as! String)
                self.agentOwner.append(myLine["agentOwner"]! as! Int)
                self.canLogin.append(myLine["canLogin"]! as! String)
                self.city.append(myLine["city"]! as! String)
                self.country.append(myLine["country"]! as! String)
                self.customRegistrationFields.append(myLine["customRegistrationFields"]! as! String)
                self.disabled.append(myLine["disabled"]! as! String)
                self.email.append(myLine["email"]! as! String)
                self.email2.append(myLine["email2"]! as! String)
                self.firstName.append(myLine["firstName"]! as! String)
                self.id.append(myLine["id"]! as! Int)
                self.lastActivityDate.append(myLine["lastActivityDate"]! as! String)
                self.lastEdited.append(myLine["lastEdited"]! as! String)
                self.lastName.append(myLine["lastName"]! as! String)
                self.phone.append(myLine["phone"]! as! String)
                self.receiveUpdates.append(myLine["receiveUpdates"]! as! String)
                self.savedProperties.append(myLine["savedProperties"]! as! Int)
                self.savedSearches.append(myLine["savedSearches"]! as! Int)
                self.stateProvince.append(myLine["stateProvince"]! as! String)
                self.subscribeDate.append(myLine["subscribeDate"]! as! String)
                self.zipCode.append(myLine["zipCode"]! as! Int)
            }
            
            /******** End Parse JSON **********/
            
        }
   )}
    
}

