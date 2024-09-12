//
//  GameViewController.swift
//  Tapper
//
//  Created by Jad Rammal on 12/09/2024.
//

import UIKit

class GameViewController: UIViewController {
    
    var count: Int?
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var tapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.layer.cornerRadius = tapButton.frame.width/2
        countLabel.layer.cornerRadius = 20
    }
    
    @IBAction func onTapButtonPress(_ sender: Any) {
        if let countText = countLabel.text, var countNumber = Int(countText) {
            countNumber += 1
            countLabel.text = String(countNumber)
            guard countNumber < count ?? 0 else {
                countLabel.text = "You Won!"
                return
            }
        }
    }
    
}
