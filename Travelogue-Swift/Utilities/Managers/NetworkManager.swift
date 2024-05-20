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

protocol AuthenticationService {
    func signIn(user: User, password: String) async throws -> AuthDataResult
    func signUp(user: User, password: String) async throws -> AuthDataResult
}

protocol FirestoreService {
    func saveData(data: [String: Any], collection: String, documentId: String?) async throws
    func fetchData(collection: String) async throws -> [[String: Any]]
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
    
    func signIn(user: User, password: String) async throws -> AuthDataResult {
        do {
            let result = try await Auth.auth().signIn(withEmail: user.email, password: password)
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
    
    func saveData(data: [String : Any], collection: String, documentId: String?) async throws {
        do {
            var ref: DocumentReference!
            if let documentId = documentId {
                ref = db.collection(collection).document(documentId)
            } else {
                ref = db.collection(collection).document()
            }
            try await ref.setData(data)
        } catch {
            throw error
        }
    }
    
    func fetchData(collection: String) async throws -> [[String : Any]] {
        do {
            let querySnapshot = try await db.collection(collection).getDocuments()
            let data = querySnapshot.documents.compactMap { $0.data() }
            return data
        } catch {
            throw error
        }
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
