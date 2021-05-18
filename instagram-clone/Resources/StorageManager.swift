//
//  StorageManager.swift
//  instagram-clone
//
//  Created by Fernando Moreira on 14/05/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    // MARK: - Public:
    
    public enum IGStorageManageError: Error {
        case failedToDownload
    }
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, IGStorageManageError>) -> Void) {
        bucket.child(reference).downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        })
    }
    
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let postType: UserPostType
}
