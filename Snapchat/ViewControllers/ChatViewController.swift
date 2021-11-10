//
//  ChatViewController.swift
//  Snapchat
//
//  Created by Eduardo Honores on 10/28/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChatViewController: UIViewController {
    @IBOutlet weak var tfMessage: UITextField!
    
    var ref: DatabaseReference!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        var data = ["idec1" : ["tittle" : "Soccer" , "topics" : ["idt1" : true , "idt2" :  true]], "idec2" : ["tittle" : "Moon" , "topics" :["idt2 : true"]]]
        
        ref.child("categories").setValue(data)
    }
    

}
