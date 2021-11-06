//
//  ResultViewController.swift
//  NikolaevAA_2.6
//
//  Created by Anton Nikolaev on 05.11.2021.
//

import UIKit

protocol ViewColorDelegate {
    func rgbDrawView(color: UIColor)
}

class ResultViewController: UIViewController{
    
    @IBOutlet var backGroundView: UIView!
    
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(color!)
        rgbDrawView(color: color)
    }
}

extension ResultViewController: ViewColorDelegate {
    func rgbDrawView(color: UIColor) {
        backGroundView.backgroundColor = color
    }
}
