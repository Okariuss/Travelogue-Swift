//
//  NetworkManager.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 30.04.2024.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import CoreData

protocol AuthenticationService {
    func signIn(email: String, password: String) async throws -> AuthDataResult
    func googleSignIn(_ vc: UIViewController) async throws -> AuthDataResult
    func signUp(user: User, password: String) async throws -> AuthDataResult
}

protocol FirestoreService {
    func saveData(data: NSManagedObject, collection: String, documentId: String?) async throws
    func fetchData<Entity: NSManagedObject>(collection: String, context: NSManagedObjectContext) async throws -> [Entity]
}

protocol StorageService {
    func uploadImage(imageData: Data) async throws -> URL
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private let db = Firestore.firestore()
    
    private let storage = Storage.storage()
}


// MARK: Authentication
extension NetworkManager: AuthenticationService {
    
    func signIn(email: String, password: String) async throws -> AuthDataResult {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result
        } catch {
            throw error
        }
    }
    
    func googleSignIn(_ vc: UIViewController) async throws -> AuthDataResult {
        do {
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                fatalError("No client ID found in Firebase Configuration")
            }
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: vc)
            
            guard let idToken = gidSignInResult.user.idToken?.tokenString else {
                throw URLError(.badServerResponse)
            }
            let accessToken = gidSignInResult.user.accessToken.tokenString
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            let result = try await Auth.auth().signIn(with: credential)
            return result
        } catch {
            throw error
        }
    }
    
    func signUp(user: User, password: String) async throws -> AuthDataResult {
        do {
            let result = try await Auth.auth().createUser(withEmail: user.email, password: password)
            return result
        } catch {
            throw error
        }
    }
}

// MARK: Firestore
extension NetworkManager: FirestoreService {
    
    func saveData(data: NSManagedObject, collection: String, documentId: String?) async throws {
        do {
            var ref: DocumentReference!
            if let documentId = documentId {
                ref = db.collection(collection).document(documentId)
            } else {
                ref = db.collection(collection).document()
            }
            
            let attributes = data.entity.attributesByName
            var userData = [String: Any]()
            for (key, _) in attributes {
                if let value = data.value(forKey: key) {
                    userData[key] = value
                }
            }
            
            try await ref.setData(userData)
        } catch {
            throw error
        }
    }

    
    func fetchData<Entity: NSManagedObject>(collection: String, context: NSManagedObjectContext) async throws -> [Entity] {
        let querySnapshot = try await db.collection(collection).getDocuments()
        var entities = [Entity]()
        
        for document in querySnapshot.documents {
            let entity = NSEntityDescription.insertNewObject(forEntityName: String(describing: Entity.self), into: context) as! Entity
            let attributes = entity.entity.attributesByName
            
            for (key, _) in attributes {
                if let value = document.data()[key] {
                    if let timestamp = value as? Timestamp {
                        entity.setValue(timestamp.dateValue(), forKey: key)
                    } else {
                        entity.setValue(value, forKey: key)
                    }
                }
            }
            
            entities.append(entity)
        }
        
        return entities
    }
}

// MARK: Storage
extension NetworkManager: StorageService {
    func uploadImage(imageData: Data) async throws -> URL {
        let storageRef = storage.reference().child("images/\(UUID().uuidString).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        do {
            storageRef.putData(imageData, metadata: metadata)
            let url = try await storageRef.downloadURL()
            return url
        } catch {
            throw error
        }
    }
}
