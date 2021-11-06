//
//  ResultViewController.swift
//  NikolaevAA_2.6
//
//  Created by Anton Nikolaev on 05.11.2021.
//

import UIKit

class ResultViewController: UIViewController{
    
    @IBOutlet var backGroundView: UIView!
    var delegate: ColorDelegate!
    var colorRGB: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.drawViewColorRGB(color: colorRGB)
    }
    
}
