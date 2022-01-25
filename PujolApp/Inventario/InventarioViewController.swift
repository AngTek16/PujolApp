//
//  InventarioViewController.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import UIKit

class InventarioViewController: UIViewController {
    
    var inventarioCollectionView : UICollectionView = { // Ponemos el nombre de la var, su tipo y lo igualamaos a {}()
        
        let layout = UICollectionViewFlowLayout() // Declaramo un layout el cual nos servirá para definir los atributtos del collectionView
        layout.scrollDirection = .vertical // Aqui definimos el tipo de scroll que tendrá el collection
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(InventarioCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .purple
        collection.showsVerticalScrollIndicator = true
        collection.showsHorizontalScrollIndicator = true
        return collection // Debemos retornar un valor del tipo del cual estamos declarando
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
        initUI()
    }
    
    
    func initUI(){
        
        
        view.addSubview(inventarioCollectionView)
        inventarioCollectionView.addAnchors(left: 20, top: 20, right: 20, bottom: 20)
        
    }


}
