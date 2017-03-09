//
//  PIctureViewController.swift
//  MyInstagram
//
//  Created by Hung Do on 3/5/17.
//  Copyright © 2017 Hung Do. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var uploadImage: UIImageView!
    var postImage : UIImage?

    
    @IBAction func onTake(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.camera
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onUpload(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        Post.postUserImage(image: postImage, withCaption: userText.text, withCompletion: nil)

        
//        Post.postUserImage(image: postImage, withCaption: userText.text) { (success: Bool, error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            }else{
//            }
//        }
//        
//        dismiss(animated: true, completion: nil)
//
//
//    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.backgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "instaback")!)
        navigationController?.navigationBar.barTintColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        uploadImage.image = nil
        uploadImage.image = originalImage
        postImage = originalImage
        
        
//       let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))

        let resizeImageView = UIImageView(frame: rect)
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
