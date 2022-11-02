//
//  GoogleAuthManager.swift
//  SocialAuthentication
//
//  Created by Shivaditya Kumar on 2022-11-02.
//

import UIKit
import GoogleSignIn

// Provide ClientID
class GoogleAuthManager: NSObject {
    static let signInConfig = GIDConfiguration(clientID: "") // Add Client ID and Client Certificate to The App
    
    static func loginWithGoogleId(view: UIViewController, completion: @escaping (Error?,GIDGoogleUser?) -> Void) {
        GIDSignIn.sharedInstance.signIn(with: GoogleAuthManager.signInConfig, presenting: view) { user, error in
            guard error == nil else {
                completion(error,nil)
                return
            }
            completion(nil,user)
        }
    }
}
