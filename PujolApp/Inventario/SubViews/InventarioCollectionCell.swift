//
//  InventarioCollectionCell.swift
//  PujolApp
//
//  Created by Teki on 24/01/22.
//

import Foundation
import UIKit

class InventarioCollectionCell : UICollectionViewCell{ // Definimos una nueva clase la cual hereda de UICollectionViewCell que nos ayudará a dar estilo a las celdas del collectionView
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let color = UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        self.backgroundColor = color
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
