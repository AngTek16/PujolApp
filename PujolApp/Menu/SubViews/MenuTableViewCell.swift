//
//  MenuTableViewCell.swift
//  PujolApp
//
//  Created by Teki on 17/01/22.
//

import Foundation
import UIKit


protocol MenuTableViewCellDelegate{
    func addToCard(product : Producto, count : Int)
}

class MenuTableViewCell : UITableViewCell{
    
    var delegate : MenuTableViewCellDelegate?
    
    var ownContent : UIView?
    var nameProduct : UILabel?
    var descriptionProduct : UILabel?
    var priceProduct : UILabel?
    
    var addButton : UIButton?
    var imageProduct : UIImageView?
    
    var producto : Producto?
    
    var count = 0
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var counterLabel : UILabel = {
       let label = UILabel()
        label.text = "0"
        return label
    }()
    
    init(producto : Producto, numberOf : Int){
        super.init(style: .default, reuseIdentifier: nil)
        self.producto = producto
        self.count = numberOf
        self.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: height/5 - 10))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 10
        self.contentView.addSubview(ownContent!)
        
        
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
        
        
        addButton = UIButton(frame: CGRect(x: 10, y: (height/5 - 10) - 45, width: 90, height: 35))
        addButton?.backgroundColor = .white
        addButton?.setTitle("Agregar", for: .normal)
        addButton?.setTitleColor(.orange, for: .normal) // Modificamos el color del titulo del boton
        addButton?.layer.borderColor = UIColor.orange.cgColor
        addButton?.layer.borderWidth = 1 // Aqui definimos el ancho del borde
        addButton?.layer.cornerRadius = 10
        addButton?.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        
        ownContent?.addSubview(addButton!)
        
        counterLabel.text = "\(count)"
        ownContent?.addSubview(counterLabel)
        counterLabel.addAnchorsAndSize(width: 20, height: 20, left: 10, top: nil, right: nil, bottom: 20, withAnchor: .left, relativeToView: addButton)
        
        
        
        imageProduct = UIImageView(frame: CGRect(x: width / 2, y: 10, width: width / 2 - 30, height: height/5 - 30))
        imageProduct?.image = UIImage(named: producto?.imagen ?? "")
        imageProduct?.layer.cornerRadius = 10
        imageProduct?.backgroundColor = .red
      //  imageProduct?.contentMode = .scaleAspectFit
        imageProduct?.layer.masksToBounds = true
        
        ownContent?.addSubview(imageProduct!)

        
        
    }
    
    
    @objc func addProduct(){
        print("ADD \(producto?.nombre)")
        count += 1
        counterLabel.text = "\(count)"
        delegate?.addToCard(product: producto!, count: count)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
