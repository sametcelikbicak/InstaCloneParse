//
//  SecondViewController.swift
//  InstaCloneParse
//
//  Created by Samet ÇELİKBIÇAK on 10.09.2017.
//  Copyright © 2017 Samet ÇELİKBIÇAK. All rights reserved.
//

import UIKit
import Parse

class uploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postCommentText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(uploadVC.hideKeyboard))
        self.view.addGestureRecognizer(keyboardRecognizer)
        
        
        postImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(uploadVC.choosePhoto))
        postImage.addGestureRecognizer(recognizer)
        
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }

    @objc func choosePhoto() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        postImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func postButtonClicked(_ sender: Any) {
        
        let object = PFObject(className: "Posts")
        let data = UIImageJPEGRepresentation(postImage.image!, 0.5)
        let pfImage = PFFile(name: "image.jpg", data: data!)
        
        object["postimage"] = pfImage
        object["postcomment"] = postCommentText.text
        object["postowner"] = PFUser.current()!.username!
        
        let uuid = UUID().uuidString
        object["uuid"] = "\(uuid) \(PFUser.current()!.username!)"
        
        object.saveInBackground { (success, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel,handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.postCommentText.text = ""
                self.postImage.image = UIImage(named: "select.png")
                self.tabBarController?.selectedIndex = 0
            }
            
        }
        
    }
    

}

