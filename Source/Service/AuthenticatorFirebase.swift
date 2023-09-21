//
//  AuthenticatorFirebase.swift
//  AppBank
//
//  Created by Pedro Henrique on 24/08/23.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthenticatorFirebase {
    static var auth = Auth.auth()
    static var firestore = Firestore.firestore()
}
