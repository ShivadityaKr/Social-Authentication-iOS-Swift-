//
//  AppleAuthManager.swift
//  SocialAuthentication
//
//  Created by Shivaditya Kumar on 2022-11-02.
//

import Foundation
import UIKit
import AuthenticationServices

class AppleAuthManager: NSObject, ASAuthorizationControllerDelegate {
    var authController: ASAuthorizationController?
    init(completion: (ASAuthorizationController) -> Void) {
        super.init()
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        completion(controller)
        controller.performRequests()
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            debugPrint(userIdentifier)
        default:
            break
        }
    }
}
