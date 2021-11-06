//
//  ViewController.swift
//  NikolaevAA_2.6
//
//  Created by Anton Nikolaev on 04.11.2021.
//

import UIKit

protocol ColorDelegate {
    func drawViewColorRGB(color: UIColor)
}

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
        redTextFieldOutlet.delegate = self
        greenTextFieldOutlet.delegate = self
        blueTextFieldOutlet.delegate = self
        setColor()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navigationVC = segue.destination as? UINavigationController else {return}
        guard let resultViewController = navigationVC.topViewController as?
                ResultViewController else {return}
        resultViewController.colorRGB = rgbColor
        resultViewController.delegate = self
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        
    }
    
    
    //MARK: - IB Actions
    @IBAction func rgbSliders(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = "крс: " + string(from: redSlider)
            redTextFieldOutlet.text = string(from: redSlider)
            setColor()
        case greenSlider:
            greenValueLabel.text = "зел: " + string(from: greenSlider)
            greenTextFieldOutlet.text = string(from: greenSlider)
            setColor()
        default:
            blueValueLabel.text = "гол: " + string(from: blueSlider)
            blueTextFieldOutlet.text = string(from: blueSlider)
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

//MARK: - Extensions
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let redValue: String = redTextFieldOutlet.text ?? "0.1"
        let greenValue = greenTextFieldOutlet.text ?? "0.1"
        let blueValue = blueTextFieldOutlet.text ?? "0.1"
        
        redSlider.value = Float(redValue) ?? 0.1
        greenSlider.value = Float(greenValue) ?? 0.1
        blueSlider.value = Float(blueValue) ?? 0.1
        
        redValueLabel.text = "крс: " + string(from: redSlider)
        greenValueLabel.text = "зел: " + string(from: greenSlider)
        blueValueLabel.text = "гол: " + string(from: blueSlider)
        
        setColor()
    }
}

extension SettingsViewController: ColorDelegate {
    func drawViewColorRGB(color: UIColor) {
        view.backgroundColor = color
    }
}
