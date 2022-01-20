//
//  DetailProductViewController.swift
//  PujolApp
//
//  Created by Teki on 19/01/22.
//

import UIKit

class DetailProductViewController: UIViewController {

    var topImageView : UIImageView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    
    
    //MARK: - Definicion del primer elemento
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var productPrice : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = backgroundColor
        
        initUI()
    }
    
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topimage")
    
        view.addSubview(topImageView!)
        
        createProductView()
    }
    
    func createProductView(){
        productContentView = UIView(frame: CGRect(x: 20, y: height/5, width: width - 40, height: height/4))
        productContentView?.backgroundColor = .red
        view.addSubview(productContentView!)
        
        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 40, height: height/8))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 20
        
        productContentView?.addSubview(productCard!)
        
        productImage = UIImageView(frame: CGRect(x: 20, y: 0, width: (width - 40)/3, height: height/4 - 20))
        productImage?.backgroundColor = .blue
        
        productContentView?.addSubview(productImage!)
    }
    

}
