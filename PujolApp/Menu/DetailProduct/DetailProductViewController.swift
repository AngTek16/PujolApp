//
//  DetailProductViewController.swift
//  PujolApp
//
//  Created by Teki on 19/01/22.
//

import UIKit

class DetailProductViewController: UIViewController {

    var topImageView : UIImageView?
    
    var superContent : UIScrollView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    
    var backButton : UIButton?
    
    //MARK: - Definicion del primer elemento
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var productPrice : UILabel?
    
    //MARK: - Definicion de descripcion
    var descripcionView : UIView?
    var descriptionTextView : UITextView?
    var calorias : UILabel?
    var procion : UILabel?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = backgroundColor
        
        initUI()
    }
    
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topimage")
        view.addSubview(topImageView!)
        
        backButton = UIButton(frame: CGRect(x: 10, y: 50, width: 40, height: 40))
        backButton?.setImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        view.addSubview(backButton!)
        
        createProductView()
        createDescription()
    }
    
    func createProductView(){
        productContentView = UIView(frame: CGRect(x: 20, y: height/5, width: width - 40, height: height/4))
        productContentView?.backgroundColor = .blue
        view.addSubview(productContentView!)
        
        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 40, height: height/8))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 20
        
        productContentView?.addSubview(productCard!)
        
        productImage = UIImageView(frame: CGRect(x: 20, y: 0, width: (width - 40)/3, height: height/4 - 20))
        productImage?.backgroundColor = .clear
        productImage?.image = UIImage(named: "coca")
        productImage?.contentMode = .scaleAspectFit
        productContentView?.addSubview(productImage!)
        
        productName = UILabel(frame: CGRect(x: ((width - 40)/3) + 30, y:10 , width: (width - 40) - (((width - 40)/3) + 40), height: 30))
        productName?.text = "Coca cola"
        productName?.backgroundColor = .clear
        productName?.textAlignment = .center
        productName?.font = .boldSystemFont(ofSize: 20)
        productCard?.addSubview(productName!)
        
        productPrice = UILabel(frame: CGRect(x: ((width - 40)/3) + 30, y: 50, width: (width - 40) - (((width - 40)/3) + 40), height: (height/8) - 60))
        productPrice?.text = "$\(20)"
        productPrice?.font = .systemFont(ofSize: 18)
        productPrice?.textAlignment = .center
        productPrice?.backgroundColor = .clear
        productCard?.addSubview(productPrice!)
        
    }
    
    func createDescription(){
        descripcionView = UIView() // Paso 1 inicializar objeto
        descripcionView?.backgroundColor = .red
        
        view.addSubview(descripcionView!) // Paso 2 agregar el objeto a un view
        
      //  descripcionView?.addAnchors(left: 20, top: 10, right: 20, bottom: 100,withAnchor: .top, relativeToView: productContentView) // Paso 3 darle constrains
        
        
        descripcionView?.addAnchorsAndSize(width: nil, height: height/4, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: productContentView)
    }
    
    @objc func backAction(){
        print("Back")
        dismiss(animated: true)
    }
    

}
