//
//  InventarioViewController.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import UIKit

class InventarioViewController: UIViewController {
    
    var dataSoruce : MenuObject?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var inventarioCollectionView : UICollectionView = { // Ponemos el nombre de la var, su tipo y lo igualamaos a {}()
        
        let layout = UICollectionViewFlowLayout() // Declaramo un layout el cual nos servirá para definir los atributtos del collectionView
       // layout.scrollDirection = .horizontal// Aqui definimos el tipo de scroll que tendrá el collection
       
        layout.scrollDirection = .vertical
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
        getData()
    }
    
    
    func initUI(){
        
        inventarioCollectionView.delegate = self
        inventarioCollectionView.dataSource = self
        view.addSubview(inventarioCollectionView)
        inventarioCollectionView.addAnchorsWithMargin(20)
       // inventarioCollectionView.addAnchorsAndSize(width: nil, height: height / 4 + 10, left: 0, top: 20, right: 20, bottom: nil)
        
    }
    
    func getData(){
        
        // MARK: - Bebidas
        let aguaDeldia = Producto(nombre: "Agua de horchata", descripcion: "Agua a base de arroz con infusion de leche y coronado con canela", precio: 99, imagen: "horchatita", peso: 250.0, calorias: 100)
        
        let limonadanatural = Producto(nombre: "Limonada Natural", descripcion: "limonada a base de jugo natural de limon", precio: 25.0, imagen: "limonada", peso: 255, calorias: 1000)
        
        let soda = Producto(nombre: "Coca", descripcion: "Agua saborizada con sabor a cola", precio: 20, imagen: "Coca-Cola", peso: 250.0, calorias: 999)
        
        let limonadamineral = Producto(nombre: "Limonada Mineral", descripcion: "limonada a base de agua mineral con un shot de jugo natural de limon", precio: 25.0, imagen: "limonada", peso: 255, calorias: 1000)
        
        let bebidas = Categoria(nombre: "Bebidas", productos: [limonadamineral,limonadanatural,aguaDeldia,soda])
        
        // MARK: - Bebidas Alcoholicas
        let vodka = Producto(nombre: "Vodka", descripcion: "Alcohol blanco que resulta de la destilación de un jugo fermentado", precio: 45, imagen: "vodkaImagen", peso: 230, calorias: 400)
                
        let vino = Producto(nombre: "Vino", descripcion: "Bebida obtenida de la fermentación alcohólica total del zumo de uvas maduras", precio: 50.0, imagen: "vinoImagen", peso: 250, calorias: 200)
        
        let cervezaCorona = Producto (nombre: "Cerveza Corona", descripcion: "Grande", precio: 50.0, imagen: "###!", peso: 500, calorias: 100)
        
        let cervezaVictoria = Producto (nombre: "Cerveza Victoria", descripcion: "Grande", precio: 50.0, imagen: "###!", peso: 500, calorias: 100)
        
        let alcohol = Categoria(nombre: "Alcohol", productos: [vodka,vino,cervezaCorona,cervezaVictoria])
        
        // MARK: - Postres
        let flan = Producto(nombre: "Flan", descripcion: "Porción de flan con caramelo", precio: 80, imagen: "flan", peso: 200, calorias: 500)
        let jericalla = Producto(nombre: "jericalla", descripcion: "postre elaborado con leche, huevo, canela, azucar", precio: 20.0, imagen: "jericalla", peso: 0.200, calorias: 500)
        let pastel = Producto(nombre: "Pastel", descripcion: "Rebanada de pastel de chocolate", precio: 90, imagen: "pastelImagen", peso: 100, calorias: 600)
        
        let postre = Categoria(nombre: "Postre", productos: [flan,jericalla,pastel])
        
        // MARK: - Cena
        let cereales = Producto(nombre: "Cereales", descripcion: "Plato de cereales con leche a tu elección", precio: 30.0, imagen: "Cereales", peso: 100, calorias: 200)
                
        let pan = Producto(nombre: "Pieza de pan", descripcion: "Pieza de pan a tu elección", precio: 10.0, imagen: "pan", peso: 100, calorias: 300)
        let cena = Categoria(nombre: "Cena", productos: [cereales,pan])
        
        // MARK: - Comida
        let hotdog = Producto(nombre: "HotDog", descripcion: "Panecillo largo lleno con una salchicha de Frankfurt, se sirve caliente y untado de mostaza ligeramente dulce", precio: 79.99, imagen: "hotdog", peso: 380, calorias: 550)
        let hamburguesa = Producto(nombre: "Hamburguesa", descripcion: "Delicioso sandwich de carne molida con pan gourmet", precio: 89.99, imagen: "hamburguesa", peso: 380, calorias: 750)
        
        let omelet = Producto(nombre: "Omelet Clasico", descripcion: "Huevito revuelto con jamon de pavo", precio: 60.0, imagen: "omelet", peso: 475, calorias: 630)
        
        let caldoDeRes = Producto(nombre: "caldo de res", descripcion: "Caldo con carne de res y verduras", precio: 120.0, imagen: "caldo de res", peso: 0.200, calorias: 300)
        let pizza = Producto(nombre: "Pizza", descripcion: "disco de masa salada con queso y carne", precio: 150.0, imagen: "image", peso: 0.300, calorias: 500)
           
        
        let comida = Categoria(nombre: "Comida", productos: [hotdog,hamburguesa,omelet,caldoDeRes,pizza])
       
        // MARK: - Desayunos
        let jugoVerde = Producto(nombre: "Jugo Verde", descripcion: "Jugo de naranja, piña y apio", precio: 20.0, imagen: "jericalla", peso: 250, calorias: 0)
               
        let huevosRevueltos = Producto(nombre: "Huevos revueltos", descripcion: "Huevos revueltos con jamon, tocino o chorizo", precio: 70.0, imagen: "pedido", peso: 400, calorias: 500)
        
        let hotcakes = Producto(nombre: "Hotcakes", descripcion: "Discos de masa dulce", precio: 40.0, imagen: "pedido", peso: 250, calorias: 1200)
        let desayuno = Categoria(nombre: "Desayuno", productos: [jugoVerde,huevosRevueltos,hotcakes])
        
        // MARK: - Menu
        let menu = MenuObject(categorias: [desayuno,comida,cena,postre,bebidas,alcohol], title: "Menu Pujol")
        
       
        dataSoruce = menu
        
        
        inventarioCollectionView.reloadData()
 
    }


}



extension InventarioViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSoruce?.categorias?[section].productos?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = inventarioCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! InventarioCollectionCell
        
        let producto = dataSoruce?.categorias?[indexPath.section].productos?[indexPath.item]
        
       cell.setData(prodcuto: producto!)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: width / 2 - 40, height: height / 4)
      //  return ((indexPath.item % 2) != 0) ? CGSize(width: width / 2 - 40, height: height / 4) : CGSize(width: width / 2 - 40, height: height / 5)
    }
    
    

   
    
}
