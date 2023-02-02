//
//  ViewController.swift
//  CoreDataImage
//
//  Created by Sai Saketh Pendli on 02/02/23.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var photos = [PhotoGallery]()
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func ChooseButtonClicked(_ sender: Any) {
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.allowsEditing = false
        imagepicker.sourceType = .photoLibrary
        present(imagepicker,animated: true)
        
    }
    
    @IBAction func retrieveImage(_ sender: Any) {
       let dh = DataBaseHandler()
        photos = dh.retrieveData()
        myImage.image = UIImage(data: photos[photos.count-1].savedimage! as Data)
        myStatus.text = "Image retrieved from CD"
        print("image retrieved from CD")
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage =
            info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            myImage.image = pickedImage
            let dh = DataBaseHandler()
            dh.image = myImage.image
            dh.saveImage()
            myStatus.text = "image save in core data successfully"
        }
        dismiss(animated: true,completion: nil)
    }
}

