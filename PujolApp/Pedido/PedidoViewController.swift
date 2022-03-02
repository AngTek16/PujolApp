//
//  PedidoViewController.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import UIKit

class PedidoViewController: UIViewController {
    
    var userTextField : UITextField?
    var passwordTextField : UITextField?
    
    var loginButton : UIButton?
    var ojitoButton : UIButton?
    
    var userLabel : UILabel?
    
    var lalalaLabel : UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    var defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        
        validateUser()
    }
    
    
    func validateUser(){
        if let user = defaults.string(forKey: "User"){
            userLogged(name: user)
        }else{
            initUI()
        }
    }
    
    
    func userLogged(name : String){
        userLabel = UILabel(frame: CGRect(x: 30, y: 50, width: width - 60, height: 50))
        userLabel?.text = "Bienvenido \(name)"
        userLabel?.textAlignment = .center
        userLabel?.font = .boldSystemFont(ofSize: 20)
        view.addSubview(userLabel!)
        
        view.addSubview(lalalaLabel)
        
    }
    
    
    func initUI(){
        
        userTextField = UITextField(frame: CGRect(x: 30, y: 150, width: width - 60, height: 50))
        userTextField?.placeholder = "User"
        userTextField?.textAlignment = NSTextAlignment.center
        userTextField?.backgroundColor = .white
        userTextField?.layer.cornerRadius = 5
        userTextField?.layer.borderColor = UIColor.gray.cgColor
        userTextField?.layer.borderWidth = 3
        
        view.addSubview(userTextField!)
        
        passwordTextField = UITextField(frame: CGRect(x: 30, y: 250, width: width - 160, height: 50))
        passwordTextField?.placeholder = "Pass"
        passwordTextField?.textAlignment = NSTextAlignment.center
        passwordTextField?.backgroundColor = .white
        passwordTextField?.layer.cornerRadius = 5
        passwordTextField?.layer.borderColor = UIColor.gray.cgColor
        passwordTextField?.layer.borderWidth = 3
        passwordTextField?.isSecureTextEntry = true
        passwordTextField?.delegate = self
        
        
        view.addSubview(passwordTextField!)
        
        
        ojitoButton = UIButton()
        ojitoButton?.addTarget(self, action: #selector(verPass), for: .touchUpInside)
        ojitoButton?.backgroundColor = .purple
        view.addSubview(ojitoButton!)
        ojitoButton?.addAnchorsAndSize(width: 50, height: 50, left: nil, top: 50, right: nil, bottom: nil, withAnchor: .top, relativeToView: userTextField)
        ojitoButton?.addAnchors(left: 20, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: passwordTextField)
        
        
        loginButton = UIButton()
        loginButton?.backgroundColor = .tintColor
        loginButton?.setTitle("Login", for: .normal)
        loginButton?.layer.cornerRadius = 7
        loginButton?.addTarget(self, action:#selector(loginAction) , for: .touchUpInside)
        
        view.addSubview(loginButton!)
        loginButton?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 100, right: 20, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
        
    }
    
    @objc func verPass(){
        passwordTextField?.isSecureTextEntry.toggle()
    }
    
    @objc func loginAction(){
        print("LOGIN OKOKOK")
        
        var alerta = ""
        if let pass = passwordTextField?.text{
            if pass != ""{
                print(pass)
            }else{
                alerta = "Ingrese una contraseña valida"
                
            }
        }
        
        if let user = userTextField?.text{
            if user != ""{
                print(user)
                defaults.set(user, forKey: "User") // Aqui guardamos el string user en Userdefaults
            }else{
                alerta = "Ingrese un usuario valido"
            }
        }
        
        
       
        if alerta != ""{
            let alertView = UIAlertController(title: "Error", message: alerta, preferredStyle: .alert)
            let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alertView.addAction(aceptar)
            self.present(alertView, animated: true, completion: nil)
        }else{
            userTextField?.removeFromSuperview()
            passwordTextField?.removeFromSuperview()
            ojitoButton?.removeFromSuperview()
            loginButton?.removeFromSuperview()
            
            if let username = defaults.string(forKey: "User"){
                userLogged(name: username)
            }
            
        }
    
    }

}


extension PedidoViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let textFieldText = textField.text{
            if let rangeOfTextToReplace = Range(range, in: textFieldText){
                let substringToReplace = textFieldText[rangeOfTextToReplace]
                let count = textFieldText.count - substringToReplace.count + string.count
                return count <= 5
            }
        }

      return false
    }
    
}
