//
//  Sample+CoreDataProperties.swift
//  sampledelete
//
//  Created by Sai Saketh Pendli on 03/01/23.
//
//

import Foundation
import CoreData


extension Sample {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sample> {
        return NSFetchRequest<Sample>(entityName: "Sample")
    }

    @NSManaged public var name: String?

}

extension Sample : Identifiable {

}
