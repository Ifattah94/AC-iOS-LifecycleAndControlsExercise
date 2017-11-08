//
//  SettingsViewController.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //Switch
    @IBOutlet weak var alternatingCellsSwitch: UISwitch!
    
    
    @IBOutlet weak var alternatingCellsLabel: UILabel!
    
    var switchIsOn: Bool = true {
        didSet {
            alternatingCellsLabel.text = (switchIsOn ? "alternating cells" : "regular cells")
        }
    }
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        Settings.shouldAlternate = !Settings.shouldAlternate
        self.switchIsOn = sender.isOn
    }
    
   //Stepper
    @IBOutlet weak var numberOfRowsLabel: UILabel!
    
    
    @IBOutlet weak var numberOfRowsStepper: UIStepper!
    
    var currentValStepper: Double = 0 {
        didSet {
            numberOfRowsLabel.text = "Rows: \(currentValStepper)"
            numberOfRowsStepper.value = currentValStepper
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        Settings.rowNum = Int(sender.value)
        currentValStepper = sender.value
    }
    
    //Segmented Control
    
    @IBOutlet weak var settingSegment: UISegmentedControl!
    
    
    @IBAction func segmentedControlSwitch(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Settings.capitalization = .lower
        case 1:
            Settings.capitalization = .upper
        case 2:
            Settings.capitalization = .proper
        default:
            break
        }
        
    }
    
    
    
    //Slider
    
    @IBOutlet weak var colorView: UIView!
    
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    
    var currentGreen: CGFloat = Settings.color.1
    var currentRed: CGFloat = Settings.color
    .0
    var currentBlue: CGFloat = Settings.color.2
    
    @IBAction func redSliderChange(_ sender: UISlider) {
        self.currentRed = CGFloat(sender.value)
          colorView.backgroundColor = UIColor(displayP3Red: currentRed, green: currentGreen, blue: currentBlue, alpha: 1)
        redLabel.text = "Red: \(currentRed)"
        Settings.color.red = CGFloat(sender.value)
    }
    
    
    @IBAction func greenSliderChange(_ sender: UISlider) {
        self.currentGreen = CGFloat(sender.value)
          colorView.backgroundColor = UIColor(displayP3Red: currentRed, green: currentGreen, blue: currentBlue, alpha: 1)
        greenLabel.text = "Green: \(currentGreen)"
        Settings.color.green = CGFloat(sender.value)
    }
    
    
    @IBAction func blueSliderChange(_ sender: UISlider) {
        self.currentBlue = CGFloat(sender.value)
        colorView.backgroundColor = UIColor(displayP3Red: currentRed, green: currentGreen, blue: currentBlue, alpha: 1)
        blueLabel.text = "Blue: \(currentBlue)"
        Settings.color.blue = CGFloat(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchIsOn = alternatingCellsSwitch.isOn
        numberOfRowsLabel.text = "Rows: \(currentValStepper)"
       
    }


}
