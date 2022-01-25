//
//  InventarioCollectionCell.swift
//  PujolApp
//
//  Created by Teki on 24/01/22.
//

import Foundation
import UIKit

class InventarioCollectionCell : UICollectionViewCell{ // Definimos una nueva clase la cual hereda de UICollectionViewCell que nos ayudará a dar estilo a las celdas del collectionView
    
    
    
    var imageProduct : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .orange
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "back")
        return image
    }()
    
    var nameProduct : UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.text = "Test"
        label.backgroundColor = .magenta
        label.font = .boldSystemFont(ofSize: 10)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let color = UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        self.backgroundColor = color
        
        
        
        self.addSubview(imageProduct)
        imageProduct.addAnchors(left: 10, top: 10, right: 10, bottom: 30)
        
        
       
        self.addSubview(nameProduct)
        nameProduct.addAnchors(left: 10, top: 10, right: 10, bottom: 10, withAnchor: .top, relativeToView: imageProduct)
        
    }
    
    func setData(prodcuto : Producto){
        imageProduct.image = UIImage(named: prodcuto.imagen ?? "")
        nameProduct.text = prodcuto.nombre ?? ""
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
