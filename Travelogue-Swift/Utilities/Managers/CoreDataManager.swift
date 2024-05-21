//
//  CoreDataManager.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 20.05.2024.
//

import CoreData
import UIKit

final class CoreDataManager<Entity: NSManagedObject> {
    
    private let persistentContainer: NSPersistentContainer
    private let entityName: String
    
    init(entityName: String, persistentContainer: NSPersistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer) {
        self.entityName = entityName
        self.persistentContainer = persistentContainer
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func create() -> Entity {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)!
        return NSManagedObject(entity: entity, insertInto: context) as! Entity
    }
    
    func fetchAll() -> [Entity]? {
        let request = NSFetchRequest<Entity>(entityName: entityName)
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Failed to fetch entities: \(error)")
            return nil
        }
    }
    
    func fetch(by predicate: NSPredicate) -> [Entity]? {
        let request = NSFetchRequest<Entity>(entityName: entityName)
        request.predicate = predicate
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Failed to fetch entities: \(error)")
            return nil
        }
    }
    
    func delete(entity: Entity) {
        context.delete(entity)
        saveContext()
    }
    
    func deleteAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            saveContext()
        } catch {
            print("Failed to delete entities: \(error)")
        }
    }
}

