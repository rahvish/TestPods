

import Foundation
import UIKit
import CoreData

class DataBaseHandler{
    
    var image:UIImage? = nil
    
    func saveImage(){
        
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        let photoObject = NSEntityDescription.insertNewObject(forEntityName: "PhotoGallery", into: context) as! PhotoGallery
        photoObject.savedimage = image?.jpegData(compressionQuality: 1) as Data?
        
        do {
            try context.save()
            print("Data has saved")
        } catch  {
            print("Error occured while saving data")
        }
    }
    func retrieveData() -> [PhotoGallery]{
        
        var photos = [PhotoGallery]()
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        do {
            photos = try (context.fetch(PhotoGallery.fetchRequest()))
        } catch  {
            print("error in retriving the data")
        }
        return photos
        
    }
}
