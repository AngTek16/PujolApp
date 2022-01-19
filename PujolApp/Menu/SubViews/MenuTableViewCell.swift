//
//  MenuTableViewCell.swift
//  PujolApp
//
//  Created by Teki on 17/01/22.
//

import Foundation
import UIKit

class MenuTableViewCell : UITableViewCell{
    
    var nameProduct : UILabel?
    var descriptionProduct : UILabel?
    var priceProduct : UILabel?
    
    var addButton : UIButton?
    var imageProduct : UIImageView?
    
    var producto : Producto?
    
    init(producto : Producto){
        super.init(style: .default, reuseIdentifier: nil)
        self.producto = producto
        self.backgroundColor = .purple
        
        initUI()
    }
    
    func initUI(){
        nameProduct = UILabel(frame: CGRect(x: 5, y: 5, width: 100, height: 20))
        nameProduct?.text = producto?.nombre
        nameProduct?.textAlignment = .center
        
        self.addSubview(nameProduct!)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
