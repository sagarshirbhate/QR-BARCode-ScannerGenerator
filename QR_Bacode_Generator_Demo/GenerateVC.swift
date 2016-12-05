//
//  GenerateVC.swift
//  QR_Bacode_Generator_Demo
//
//  Created by Sagar Shirbhate on 12/5/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

import UIKit
import AVFoundation

class GenerateVC: UIViewController ,UITableViewDelegate ,UITableViewDataSource {

    var types  = [Dictionary<String, String>]()
    var selectedType : String?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        types = Qr_Barcode_Genrator.sharedInstance.getTypesOfCode()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateClick(_ sender: AnyObject) {
        self.view.endEditing(true)
        if (textField.text != nil && selectedType != nil) {
            
        let image =  Qr_Barcode_Genrator.sharedInstance.generateCode(string: textField.text!, type: selectedType!)
        imageView.image = image
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let a = types[indexPath.row]
        let typeName = a["Display Text"]! as String
        cell.textLabel?.text = typeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let a = types[indexPath.row]
        selectedType = a["Gen_Code"]! as String
    }
}
