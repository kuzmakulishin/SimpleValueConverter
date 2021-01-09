//
//  ConvertsViewController.swift
//  SimpleValueConverter
//
//  Created by Kuzma Kulishin on 07.01.2021.
//

import UIKit

class ConvertsViewController: UIViewController {
    
    // температура
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
    
    // расстояние
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var metLabel: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    
    
    var typeValueToConvert = ValuesToConvert()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

       
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


    

