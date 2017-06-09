//
//  ImageViewController.swift
//  wetag
//
//  Created by 冯丽文 on 2017/6/8.
//  Copyright © 2017年 Apple Inc. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    var firstInfo: [String: Any] = ["":""]
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
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
    
    @IBAction func useButton(_ sender: UIButton) {
        let label = UILabel(frame: CGRect(x: 80, y: 80, width: 100, height: 100))
        label.backgroundColor = UIColor.blue
        label.text = "Taylor Swift"
        label.textColor = UIColor.yellow
        self.view.addSubview(label)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        
        if firstInfo.isEmpty {
            photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        } else {
            photoImageView.image = firstInfo[UIImagePickerControllerOriginalImage] as? UIImage
        }
        
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
