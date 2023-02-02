//
//  PhotoGallery+CoreDataProperties.swift
//  CoreDataImage
//
//  Created by Sai Saketh Pendli on 02/02/23.
//
//

import Foundation
import CoreData


extension PhotoGallery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoGallery> {
        return NSFetchRequest<PhotoGallery>(entityName: "PhotoGallery")
    }

    @NSManaged public var savedimage: Data?

}

extension PhotoGallery : Identifiable {

}
