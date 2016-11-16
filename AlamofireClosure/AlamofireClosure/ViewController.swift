//
//  ViewController.swift
//  AlamofireClosure
//
//  Created by ASPL on 06/08/16.
//  Copyright © 2016 ASPL. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD

let kURL_base = "http://server.pogogamessupport.com/petbook/api/v1"
let kURL_login = "login"
let hud = JGProgressHUD(style: JGProgressHUDStyle.Dark)

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        apiSignIn()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func apiSignIn(apiEndPoint: NSString) -> ResponsePackage {
        
        let responsePackage = ResponsePackage()
        
        let params: [String: AnyObject] = [
            "email"     : "dasfdsf",
            "password"  :  "adsfdsf",
            "device"    : "2",
            "device_id" : ""
        ]
        
        Alamofire.request(.POST, kURL_base + "/" + kURL_login , parameters: params).responseJSON { response in
            
            switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                responsePackage.response = JSON
                responsePackage.success = true
                responsePackage.error = nil
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                responsePackage.response = response.response
                responsePackage.success = false
                responsePackage.error = error
            }
        }
        
        return responsePackage
        
    }
    
    func get(apiEndPoint: NSString, completion: (response: ResponsePackage) -> ()) -> Bool {

        let params: [String: AnyObject] = [
            "email"     : "dasfdsf",
            "password"  :  "adsfdsf",
            "device"    : "2",
            "device_id" : ""
        ]
        
        let responsePackage = ResponsePackage()
        Alamofire.request(.POST, kURL_base + "/" + kURL_login , parameters: params).responseJSON { response in
            
            switch response.result {
                
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                responsePackage.response = JSON
                responsePackage.success = true
                responsePackage.error = nil
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                responsePackage.response = response.response
                responsePackage.success = false
                responsePackage.error = error
            }
            
            completion(response: responsePackage)
        }
    }
    
    
    /*func apiSignIn() {
        hud.textLabel.text = "Logging in..."
        hud.showInView(self.view)
        
        let params: [String: AnyObject] = [
            "email"     : "dasfdsf",
            "password"  :  "adsfdsf",
            "device"    : "2",
            "device_id" : ""
        ]
        
        print(params)
        
        Alamofire.request(.POST, kURL_base + "/" + kURL_login , parameters: params).responseJSON { response in
            
            hud.dismiss()
            
            switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }*/
    
}

