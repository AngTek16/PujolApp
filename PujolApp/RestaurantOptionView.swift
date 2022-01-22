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
        
        icon = UIImageView(frame: CGRect(x: 10, y: 5, width: 40, height: 40))
        icon?.backgroundColor = .white
        icon?.image = UIImage(named: iconName)
        icon?.contentMode = .scaleAspectFit
        self.addSubview(icon!)
        
        titleSection = UILabel(frame: CGRect(x: 70, y: 0, width: frame.width - 80, height: 50))
        titleSection?.backgroundColor = .white
        titleSection?.text = titleString
        titleSection?.textAlignment = .center
        titleSection?.font = UIFont(name: "Helvetica Bold", size: 17)
        self.addSubview(titleSection!)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
