//
//  ViewController.swift
//  SocialAuthentication
//
//  Created by Shivaditya Kumar on 2022-11-02.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController{
    
    @IBOutlet weak var appleButton: AppButton!
    @IBOutlet weak var facebookButton: AppButton!
    @IBOutlet weak var googleButton: AppButton!
    var controller: ASAuthorizationController? {
        didSet {
            controller?.presentationContextProvider = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    private func setupUI() {
        // Apple Button
        self.appleButton.setIcon(iconType: .apple)
        self.appleButton.setTitle("Sign in With Apple", for: .normal)
        self.appleButton.addTarget(self, action: #selector(didTapAppleBtn), for: .touchUpInside)
        // Facebook Button
        self.facebookButton.setIcon(iconType: .facebook)
        self.facebookButton.setTitle("Sign in With Facebook", for: .normal)
        self.facebookButton.addTarget(self, action: #selector(didTapFacebookBtn), for: .touchUpInside)
        // Google Button
        self.googleButton.setIcon(iconType: .google)
        self.googleButton.setTitle("Sign in With Google", for: .normal)
        self.googleButton.addTarget(self, action: #selector(didTapGoogleBtn), for: .touchUpInside)
    }
    
    @objc func didTapAppleBtn() {
        self.loginWithAppleId()
    }
    
    @objc func didTapFacebookBtn() {
        FacebookAuthManager.loginWithFacebookId(view: self) { error, _credential, _result in
            if let error {
                debugPrint("Error in Login \(error)")
            } else {
                debugPrint("Data: \(_credential)")
            }
        }
    }
    
    @objc func didTapGoogleBtn() {
        GoogleAuthManager.loginWithGoogleId(view: self) { error, data in
            if let error {
                debugPrint("Error In Login \(error)")
            } else {
                debugPrint("Data : \(data)")
            }
        }
    }
}

extension ViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func loginWithAppleId() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        self.controller = controller
        controller.performRequests()
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            debugPrint("Data: \(appleIDCredential)")
        default:
            break
        }
    }
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
