//
//  MenuTableViewCell.swift
//  PujolApp
//
//  Created by Teki on 17/01/22.
//

import Foundation
import UIKit

class MenuTableViewCell : UITableViewCell{
    
    var ownContent : UIView?
    var nameProduct : UILabel?
    var descriptionProduct : UILabel?
    var priceProduct : UILabel?
    
    var addButton : UIButton?
    var imageProduct : UIImageView?
    
    var producto : Producto?
    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(producto : Producto){
        super.init(style: .default, reuseIdentifier: nil)
        self.producto = producto
        self.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: height/6 - 10))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 10
        self.addSubview(ownContent!)
        
        
        nameProduct = UILabel(frame: CGRect(x: 5, y: 5, width: width/2, height: 20))
        nameProduct?.text = producto?.nombre
        nameProduct?.textAlignment = .left
        nameProduct?.font = .boldSystemFont(ofSize: 18)
        ownContent?.addSubview(nameProduct!)
        
        descriptionProduct = UILabel(frame: CGRect(x: 5, y: 30, width: width/2, height: 70))
        descriptionProduct?.text = producto?.descripcion
        descriptionProduct?.numberOfLines = 0
        descriptionProduct?.textAlignment = .left
        descriptionProduct?.adjustsFontSizeToFitWidth = true
        ownContent?.addSubview(descriptionProduct!)
        

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
