//
//  CoreDataStack.swift
//  Shoppe
//
//  Created by Sergey on 12.07.2026.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    private init() {}
    
    lazy var presistentContainer: NSPersistentContainer = {
        let model = createManageObject()
        let container = NSPersistentContainer(name: "Shoppe", managedObjectModel: model)
        
        container.loadPersistentStores {description, error in
            if let error = error {
                fatalError("Ошибка загрузки Core Data: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        presistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                print("Ошибка сохранения: \(error)")
            }
        }
    }
}

