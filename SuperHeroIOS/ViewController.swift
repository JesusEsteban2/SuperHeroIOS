//
//  ViewController.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 11/4/24.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {


    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var model:Array<SuperHero> = []
    let api=ApiHttp()
    var searchActive=false

    override func viewDidLoad() {
    super.viewDidLoad()

    self.search.delegate = self
    self.tableView.dataSource=self
    
    // Do any additional setup after loading the view.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        print("Texto de search: \(searchBar.text!)")
        
        Task{
            do {
                try await model = api.searchByName(query: searchBar.text!)
                print ("Prueba recibida: \(model[0].name)")
                
            } catch {
                print ("No se ha podido conectar")
            }
            
            tableView.reloadData()
        }
    }

    /*
     Con esta función busca cada vez que tecleamos un caracter
     
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count<5 {
            return
        }
        
        Task{
            do {
                try await model = api.searchByName(query: searchText)
                print ("Prueba recibida: \(model[0].name)")
                
            } catch {
                print ("No se ha podido conectar")
            }
            
            tableView.reloadData()
        }
    }
*/

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell:SuperTableViewCell = tableView.dequeueReusableCell(withIdentifier: "standarCell", for:indexPath) as! SuperTableViewCell
        
    let fila = model[indexPath.row]
    
    // Transforma String a Int, valor por defecto 0
    var p,s,i:Int
    
    // Convertir a Int de forma segura
    p=strintToInt(s:fila.powerstats.power)
    s=strintToInt(s:fila.powerstats.speed)
    i=strintToInt(s:fila.powerstats.intelligence)
    
    cell.render(ima:fila.image.url,tit:fila.name,pow:p, spee:s,intel:i)
        
    return cell
}
    
    @IBSegueAction func toDetailView(_ coder: NSCoder) -> SecondViewController? {
        let fila=tableView.indexPathForSelectedRow
        
        
         
        // print("Has pasado: \(filaGen.nombre)")
        let viewController = SecondViewController(coder: coder)
         
         
         viewController?.superParam=model[fila!.row]
         viewController?.filaParam=fila!.row
         
        return viewController
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    model.count
}

// Convierte de forma segura de string a int, si no hay conversión de valor
// devuelve 0.
func strintToInt (s:String)->Int {
    var r:Int
    
    if Int(s)==nil {
        r=0
    } else {
        r=Int(s)!
    }
        return r
}


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
*/
}
