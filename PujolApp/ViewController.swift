//
//  ViewController.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var menuOption : RestaurantOptionView?
    var inventarioOption : RestaurantOptionView?
    var pedidoOption : RestaurantOptionView?
    
    ///Cuando definamos un color con UIColor recordemos que los valores deben ir entre 0 y 1, diviendiendo el numero que me den entre 255
    var backgorundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    
    
    var width = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Aqui cambiamos de color el fondo de esta viewController
        view.backgroundColor = backgorundColor
        initUI()
    }
    
    func initUI(){

        menuOption = RestaurantOptionView(iconName: "menu", titleString: "Menu Pujol") // 1
        view.addSubview(menuOption!) // 2
        menuOption?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 100, right: 20, bottom: nil) // 3
        
        let tapMenu = UITapGestureRecognizer(target: self, action: #selector(goToMenu))
        menuOption?.addGestureRecognizer(tapMenu)
        
        inventarioOption = RestaurantOptionView(iconName: "inventario", titleString: "Inventario")
        view.addSubview(inventarioOption!)
        
        let tapInventario = UITapGestureRecognizer(target: self, action: #selector(goToInventario))
        inventarioOption?.addGestureRecognizer(tapInventario)

        inventarioOption?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 50, right: 20, bottom: nil, withAnchor: .top, relativeToView: menuOption)
        
        pedidoOption = RestaurantOptionView(iconName: "pedido", titleString: "Hacer un pedido")
        view.addSubview(pedidoOption!)

        pedidoOption?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 50, right: 20, bottom: nil, withAnchor: .top, relativeToView: inventarioOption)
        
        ///UITapGestureRecognizer nos sirve para poder cachar la accion de Tap en un objeto, que no es capaz de hacerlo por si mismo
        let tapPedido = UITapGestureRecognizer(target: self, action: #selector(goToPedido))
        //Aqui le asignamos el gesture a una view
        pedidoOption?.addGestureRecognizer(tapPedido)
        
    }
    
    @objc func goToMenu(){
        print("Vamos por el menu!")
        
        let menuViewController = MenuViewController() // Inicializamos el objeto parea pasarlo a la funcion present
        present(menuViewController, animated: true, completion: {
            print("Ya se termino de presentar :)")
        }) // Aqui presentamos el viewController, animado y sin usar completion
    }
    
    @objc func goToInventario(){
        print("Vamos por el inventario!")
        let inventarioViewController = InventarioViewController()
        present(inventarioViewController, animated: true, completion: nil)
    }
    
    @objc func goToPedido(){
        print("Vamos por el pedido!")
        let pedidoViewControllewr = PedidoViewController()
      present(pedidoViewControllewr, animated: true, completion: nil)
    }



}

