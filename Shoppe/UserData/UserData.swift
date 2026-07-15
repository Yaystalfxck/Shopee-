//
//  UserData.swift
//  Shoppe
//
//  Created by Sergey on 12.07.2026.
//

import Foundation
import CoreData

class UserData {
    
    static let shared = UserData()
    
    private init() {}
    
    private var context: NSManagedObjectContext {
        CoreDataStack.shared.context
    }
    
    
    
    func add(name: String, email: String, password: String, number: String) {
        let entity = UserEntityModel(context: context)
        entity.id = UUID()
        entity.name = name
        entity.email = email
        entity.password = password
        entity.number = number
        
        CoreDataStack.shared.saveContext()
    }
    
    
    
    func fetchAll() -> [UserEntityModel] {
        let request: NSFetchRequest<UserEntityModel> = NSFetchRequest(entityName: "Users")
        
        do {
            return try context.fetch(request)
        } catch {
            print("Ошибка получения данных: \(error)")
            return []
        }
    }
    
   
    
    func isEmailTaken(_ email: String) -> Bool {
        let request: NSFetchRequest<UserEntityModel> = NSFetchRequest(entityName: "Users")
        request.predicate = NSPredicate(format: "email ==[c] %@", email)
        
        do {
            let results = try context.fetch(request)
            return !results.isEmpty
        } catch {
            print("Ошибка проверки email: \(error)")
            return false
        }
    }
}
