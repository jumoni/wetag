//
//  ViewController.swift
//  wetag
//
//  Created by 冯丽文 on 2017/6/8.
//  Copyright © 2017年 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate  {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectPicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        } else {
            print("failed to read from photolibrary")
        }
            
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        print(info)
        
        let sendInfo = info
        self.performSegue(withIdentifier: "select", sender: sendInfo)
        
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "select" {
            let controller = segue.destination as! ImageViewController
            controller.firstInfo = (sender as? [String: Any])!
        }
    }

    
    @IBAction func VRCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
        } else {
            print("open camera failed!")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

