//
//  ViewController.swift
//  Snapchat
//
//  Created by Eduardo Honores on 10/27/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class iniciarSesionViewController: UIViewController {
    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Actions
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){
            (user, error) in
            print("Intentando Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error: \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
                    print("Intentando crear un usuario")
                    if error != nil{
                        print("Se presente el siguente error al crear el usuario:\(error)")
                    }else{
                        print("El usuario fue creado exitosamente")
                        Database.database().reference ().child("usuarios").child(user!.user.uid).child ("email").setValue (user!.user.email)
                        
                        let alerta = UIAlertController(title: "Creacion de Usuario", message:
                            "Usuario: \(self.emailTextField.text!) se creo correct amente.",
                            preferredStyle: .alert)
                        let btn0K = UIAlertAction (title: "Aceptar", style: .default, handler:
                             { (UIAlertAction) in
                            self.performSegue (withIdentifier: "iniciarsesionsegue", sender: nil)
                        })
                        alerta.addAction (btn0K)
                        self.present (alerta, animated: true, completion: nil)
                    }
                })
            }else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
}

