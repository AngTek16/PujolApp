//
//  MenuViewController.swift
//  PujolApp
//
//  Created by Teki on 13/01/22.
//

import UIKit

class MenuViewController : UIViewController {
    
    var tableView : UITableView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var dataSoruce : MenuObject?


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        getData()
        initUI()
    }
    
    
    func initUI(){
        tableView = UITableView(frame: CGRect(x: 10, y: 20, width: width - 20, height: height - 100))
        tableView?.backgroundColor = .orange
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView!)
        
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
        let jugoVerde = Producto(nombre: "Jugo Verde", descripcion: "Jugo de naranja, piña y apio", precio: 20.0, imagen: "jugo verde", peso: 250, calorias: 0)
               
        let huevosRevueltos = Producto(nombre: "Huevos revueltos", descripcion: "Huevos revueltos con jamon, tocino o chorizo", precio: 70.0, imagen: "huevos revueltos", peso: 400, calorias: 500)
        
        let hotcakes = Producto(nombre: "Hotcakes", descripcion: "Discos de masa dulce", precio: 40.0, imagen: "hotcakes", peso: 250, calorias: 1200)
        let desayuno = Categoria(nombre: "Desayuno", productos: [jugoVerde,huevosRevueltos,hotcakes])
        
        // MARK: - Menu
        let menu = MenuObject(categorias: [desayuno,comida,cena,postre,bebidas,alcohol], title: "Menu Pujol")
        
        dataSoruce = menu
    }
}



// MARK: - UITableViewDataSource
extension MenuViewController : UITableViewDataSource{
    ///El numero de celdas por cada seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSoruce?.categorias?[section].productos?.count ?? 0
    }
    
    ///El tipo de celda que se mostrara
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = dataSoruce?.categorias?[indexPath.section].productos?[indexPath.row]
        let cell = MenuTableViewCell(producto: product!)
        return cell
    }
}



// MARK: - UITableViewDelegate
extension MenuViewController : UITableViewDelegate{
    ///Aqui vamos a definir el texto o VIEW que se mostrará en los headers de las seciones
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return dataSoruce?.categorias?[section].nombre ?? ""
//    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView() // Aqui definimos el UIView el cual se va a retornar en la funcion
        let color = UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1) // Creacmos una constante color en la cual se definiran colores random
        view.backgroundColor = color // Le asignamos el color random al background de la vista
        
        let image = UIImageView(frame: CGRect(x: 2, y: 2, width: 20, height: 20)) // Declaramos una imagen
        image.image = UIImage(named: "menu") //Le asignamos una imagen
        view.addSubview(image) // Lo agregamos a la vista
        
        let label = UILabel(frame: CGRect(x: 25, y: 2, width: 100, height: 20))
        label.text = dataSoruce?.categorias?[section].nombre ?? ""
        view.addSubview(label)
        
        
        return view
    }
    
    ///Cacha el Clik en cada celda para alguna accion
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Estoy en la seccion \(indexPath.section) en la celda \(indexPath.row)")
    }
    
    ///Numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSoruce?.categorias?.count ?? 0
    }
}

