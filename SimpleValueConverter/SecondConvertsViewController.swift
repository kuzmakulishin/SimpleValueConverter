//
//  ConvertsViewController.swift
//  SimpleValueConverter
//
//  Created by Kuzma Kulishin on 07.01.2021.
//

import UIKit

class ConvertsViewController: UIViewController {
    
    // элементы для ячейки температура
    @IBOutlet weak var celToFarLabel: UILabel!
    @IBOutlet weak var celLabel: UILabel!
    @IBOutlet weak var farLabel: UILabel!
    @IBOutlet weak var tempSlider: UISlider! {
        didSet {
            tempSlider.minimumValue = -100
            tempSlider.maximumValue = 100
            tempSlider.value = 0
        }
    }
    
    // элементы для ячейки расстояние
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var metLabel: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    
    
    var typeValueToConvert = ValuesToConvert.getValueList()
    var typeValueName = "name"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // по умолчанию скрываем все элементы
        updateUI()
        
        
        switch typeValueName {
        case "Температура":
            showCelToFar()
        case "Расстояние":
            showDistance()
        default:
            break
        }
        
        
        

       
    }
    
    // функция, которые показывает элементы в зависимости от выбранного параметра
    func showCurrentCellDetail(cell: [String]) {
        
        for cell in cell {
        switch cell {
        case "Температура":
            celToFarLabel.isHidden = false
            celLabel.isHidden = false
            farLabel.isHidden = false
            tempSlider.isHidden = false
        case "Скорость":
            distanceLabel.isHidden = false
            kmLabel.isHidden = false
            metLabel.isHidden = false
            distanceSlider.isHidden = false
        default:
            break
        }
        }
    }
    
    
    
    // показать Элементы для рассчёта температуры
    func showCelToFar() {
        celToFarLabel.isHidden = false
        celLabel.isHidden = false
        farLabel.isHidden = false
        tempSlider.isHidden = false
        }
    
    // показать элементы для рассчёта скорости
    func showDistance() {
        distanceLabel.isHidden = false
        kmLabel.isHidden = false
        metLabel.isHidden = false
        distanceSlider.isHidden = false
    }
    
    @IBAction func tempSliderChange(_ sender: UISlider) {
        
        // конвертируем температут цельсий в фаренгейты
        let tempC = Int(round(sender.value)) // round - округляет
        celLabel.text = "\(tempC) ºС"
        
        let tempF = Int(round((sender.value) * 1.8 + 32))
        farLabel.text = "\(tempF) ºF"
    }
}


extension ConvertsViewController {
    
    private func updateUI() {
        // чтобы изначально все стеки спрятать
        for stackView in [celToFarLabel, celLabel, farLabel, tempSlider, distanceLabel, kmLabel, metLabel, distanceSlider] {
            stackView?.isHidden = true
        }
    }
}


    

