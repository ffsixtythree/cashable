//
//  Persistence.swift
//  Shared
//
//  Created by Umid Saidov on 29/10/21.
//

import CoreData

class Persistence {
    
    private lazy var container: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "Cashable")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print(error.localizedDescription)
            }
        })
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        container.persistentStoreDescriptions = [description]
        
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
      return self.container.viewContext
    }()
    
}

extension NSManagedObjectContext {
    func saveContext() {
        if hasChanges {
            do {
                try save()
            } catch {
                let nserror = error as NSError

                print(nserror.localizedDescription)
            }
        }
    }
}
