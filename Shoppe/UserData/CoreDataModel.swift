//
//  File.swift
//  Shoppe
//
//  Created by Sergey on 12.07.2026.
//

import Foundation
import CoreData


class UserEntityModel: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var name: String
    @NSManaged var email: String
    @NSManaged var password: String
    @NSManaged var number: String
    
}

func createManageObject() -> NSManagedObjectModel {
    let model = NSManagedObjectModel()
    let entity = NSEntityDescription()
    
    entity.name = "Users"
    entity.managedObjectClassName = NSStringFromClass(UserEntityModel.self)
    
    let idAttribute = NSAttributeDescription()
        idAttribute.name = "id"
        idAttribute.attributeType = .UUIDAttributeType
        idAttribute.isOptional = false
    
    let nameAttribute = NSAttributeDescription()
        nameAttribute.name = "name"
        nameAttribute.attributeType = .stringAttributeType
        nameAttribute.isOptional = false
    
    let emailAttribute = NSAttributeDescription()
        emailAttribute.name = "email"
        emailAttribute.attributeType = .stringAttributeType
        emailAttribute.isOptional = false
    
    let passwordAttribute = NSAttributeDescription()
        passwordAttribute.name = "password"
        passwordAttribute.attributeType = .stringAttributeType
        passwordAttribute.isOptional = false
    
    let numberAttribute = NSAttributeDescription()
        numberAttribute.name = "number"
        numberAttribute.attributeType = .stringAttributeType
        numberAttribute.isOptional = false
    
    entity.properties = [idAttribute, nameAttribute, emailAttribute, passwordAttribute, numberAttribute]
    
    model.entities = [entity]
    
    return model
}
