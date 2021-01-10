//
//  TableViewController.swift
//  SimpleValueConverter
//
//  Created by Kuzma Kulishin on 07.01.2021.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var valueList = ValuesToConvert.getValueList()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    // 1
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // создаём ячейку
        // метод dequeueReusableCell нужен для того, чтобы ячейки реиспользовались, то есть в памяти были только те, которые видны на экране
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let typeValue = valueList[indexPath.row] // indexPath.row чтобы первый элемент массива попадал в первую ячейку, второй во вторую и т.д.
        
        cell.textLabel?.text = "\(typeValue)"

        return cell
    }
    
    var selectCell = ConvertsViewController()
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showcelldetail", sender: self)
    }
    
    /*
     let svc = segue.destination as? Названиевью
     svc.(название свойства второго вью) = (название свойства в таблице)
     Если непрямой сигвей, то ещё вначале нужно if segue.identifier == «название» { /// }
     */
    
    // тут экспериментировал и так и так и никак ((
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination as? ConvertsViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        // destination?.typeValueToConvert = valueList[indexPath.row]
        
        

        
    
    }
}
