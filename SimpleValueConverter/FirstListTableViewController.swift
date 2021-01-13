//
//  TableViewController.swift
//  SimpleValueConverter
//
//  Created by Kuzma Kulishin on 07.01.2021.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    
   
    
    
    var valueList = ValuesToConvert.getValueList()
    
    var valueName = ValuesToConvert()

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        var selectCellType = cell?.textLabel?.text
        
        performSegue(withIdentifier: selectCellType!, sender: Any?.self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        guard segue.identifier == "cell" else { return }
        guard let destination = segue.destination as? ConvertsViewController else { return }
        destination.typeValueName = "Текст ячейки"
    }
}


/*
 
 делаю segue без привязки к ячейке, т.е прописываю идентификатор segue, и в методе didSelectRowAt вызываю метод performSegue(withIdentifier: ид segue, sender: то что нужно передать, selectCellType)

 Затем в prepare проверяю if let text = sender as? String и передаю
 
 */



/*
     Есть метод
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
     В нем вызови метод
     let cell = tableView.cellForRow(at: indexPath)
     Через cell можно получить текст ячейки
     cell.textLabel.text - в зависимости от него или делай prepareForSegue нужный, но тогда тебе нужно на сториборде убрать переход.
     
     */

