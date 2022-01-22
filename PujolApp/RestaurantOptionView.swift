//
//  RestaurantOptionView.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import Foundation
import UIKit

class RestaurantOptionView : UIView{ // Se crea una clase que hereda de UIView
    
    var icon : UIImageView? // Atributo que es un UIImageView
    var titleSection : UILabel? // Atributo que es un UILabel
    

    init(iconName : String, titleString : String){
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = 10
        
        icon = UIImageView()
        icon?.backgroundColor = .clear
        icon?.image = UIImage(named: iconName)
        icon?.contentMode = .scaleAspectFit
        self.addSubview(icon!)
        
        icon?.addAnchorsAndSize(width: 40, height: 40, left: 10, top: 5, right: nil, bottom: nil)
        
        titleSection = UILabel()
        titleSection?.backgroundColor = .clear
        titleSection?.text = titleString
        titleSection?.textAlignment = .center
        titleSection?.font = UIFont(name: "Helvetica Bold", size: 17)
        self.addSubview(titleSection!)
        
        titleSection?.addAnchors(left: 10, top: 0, right: 0, bottom: 0, withAnchor: .left, relativeToView: icon)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
