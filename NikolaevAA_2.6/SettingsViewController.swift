//
//  ViewController.swift
//  NikolaevAA_2.6
//
//  Created by Anton Nikolaev on 04.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet var settingsView: UIView!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redTextFieldOutlet: UITextField!
    @IBOutlet var greenTextFieldOutlet: UITextField!
    @IBOutlet var blueTextFieldOutlet: UITextField!
    
    //MARK: - Public Properties
    var rgbColor: UIColor!
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultViewController = segue.destination as? ResultViewController else {return}
        resultViewController.color = rgbColor
        //resultViewController.rgbDrawView(color: rgbColor)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        
    }
    
    //MARK: - IB Actions
    @IBAction func rgbSliders(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = "крс: " + string(from: redSlider)
            setColor()
        case greenSlider:
            greenValueLabel.text = "зел: " + string(from: greenSlider)
            setColor()
        default:
            blueValueLabel.text = "гол: " + string(from: blueSlider)
            setColor()
        }
    }
    
    
    @IBAction func rgbConfirmButton() {
        
    }
    
    //MARK: - Private Methods
    private func setColor() {
        rgbColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
            )
        settingsView.backgroundColor = rgbColor
    }
    
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}
