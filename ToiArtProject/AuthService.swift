//
//  AuthService.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import FirebaseAuth

final class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    func sendSmsCode(with phoneNumber: String, completion: @escaping (Result<Void, Error>) -> Void) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let verificationID {
                    UserDefaults.standard.set(verificationID, forKey: "authVericationID")
                    completion(.success(()))
                }
            }
    }
    
    func signIn(
        with verificationCode: String,
        completion: @escaping (
            Result<
            AuthDataResult,
            Error>) -> Void
    ) {
        let verificationID = UserDefaults.standard.string(forKey: "authVericationID") ?? ""
        let credetials = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credetials) { authResult, error in
            if let error = error {
                completion(.failure(error))
            }
            if let authResult {
                
                completion(.success(authResult))
            }
        }
    }
    
    func signIn(
           with email: String,
           password: String,
           completion: @escaping (Result<Void, Error>) -> Void
       ) {
           Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
               if authDataResult != nil {
                   self.authorize()
                   completion(.success(()))
               }
               if let error {
                   completion(.failure(error))
                   print(error.localizedDescription)
               }
           }
       }
    
    func authorize() {
        let currentDate = Date()
        guard let oneMinLater = Calendar.current.date(
            byAdding: .second,
            value: 10,
            to: currentDate
        ) else { return }
        UserDefaults.standard.set(
            oneMinLater,
            forKey: "session")
    }
}
