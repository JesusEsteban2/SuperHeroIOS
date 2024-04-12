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


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText.count<5 {
            return
        }
        
        Task{
            do {
                try await model = api.searchByName(query: searchText)
                print ("Prueba recibida: \(model[0].name)")
                tableView.reloadData()
            } catch {
                print ("No se ha podido conectar")
            }
        }
    }


func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell:SuperTableViewCell = tableView.dequeueReusableCell(withIdentifier: "standarCell", for:indexPath) as! SuperTableViewCell
        
    let fila = model[indexPath.row]
        
    cell.render(ima:fila.image.url,tit:fila.name)
        
    return cell
}
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    model.count
}




/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
*/
}
