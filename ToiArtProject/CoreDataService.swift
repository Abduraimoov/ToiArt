//
//  CoreDataService.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import CoreData

enum coreDataResponse {
    case success
    case failure
}

class CoreDataService {
    
    static let shared = CoreDataService()
    
    private init() {
        
    }
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainers.viewContext
    }
    
    func addNote(id: String, title: String, description: String, date: String, completionHandler: @escaping (coreDataResponse) -> Void) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Note", in: context) else {
            completionHandler(.failure)
            return
        }
        
        let note = Note(entity: entity, insertInto: context)
        note.id = id
        note.title = title
        note.deck = description
        note.date = date
        
        appDelegate.saveContext()
        
        DispatchQueue.main.async {
            completionHandler(.success)
        }
    }
    
    func fetchNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            return try context.fetch(fetchRequest) as! [Note]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func updateNote(id: String, title: String, description: String, date: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            guard let notes = try context.fetch(fetchRequest) as? [Note], let note = notes.first(where: { note in
                note.id == id
            }) else {
                return
            }
            note.title = title
            note.deck = description
            note.date = date
            appDelegate.saveContext()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    //MARK: - Удаление внутри ячеек
    
    func delete(id: String, completionHandler: @escaping (coreDataResponse) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            guard let notes = try context.fetch(fetchRequest) as? [Note], let note = notes.first(where: { note in
                note.id == id
            }) else {
                DispatchQueue.main.async {
                    completionHandler(.failure)
                }
                return
            }
            context.delete(note)
            DispatchQueue.main.async {
                completionHandler(.success)
            }
        } catch {
            print(error.localizedDescription)
            DispatchQueue.main.async {
                completionHandler(.failure)
            }
        }
        appDelegate.saveContext()
    }
    
    
    //MARK: - Общий удаление
    
    func deleteNotes(completionHandler: @escaping (coreDataResponse) -> Void) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        do {
            guard let notes = try context.fetch(fetchRequest) as? [Note] else {
                print("No notes fetched")
                DispatchQueue.main.async {
                    completionHandler(.failure)
                }
                return
            }
            for note in notes {
                context.delete(note)
            }
            try context.save()
            DispatchQueue.main.async {
                completionHandler(.success)
            }
        } catch let error as NSError {
            print("Error in deleting notes: \(error), \(error.userInfo)")
            DispatchQueue.main.async {
                completionHandler(.failure)
            }
        }
    }
}
