//
//  RootViewController.swift
//  SuperHeroIOS
//
//  Created by Mañanas on 11/4/24.
//

import UIKit

class RootViewController: UIViewController,  UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var model:Array<SuperHero> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource=self
        // Do any additional setup after loading the view.
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
    }
    */

}
