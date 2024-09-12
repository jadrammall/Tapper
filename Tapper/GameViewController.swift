//
//  GameViewController.swift
//  Tapper
//
//  Created by Jad Rammal on 12/09/2024.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var tapButton: UIButton!
    
    var count: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.layer.cornerRadius = tapButton.frame.width/2
        countLabel.text = "\(count!)"
    }
    
    @IBAction func onTapButtonPress(_ sender: Any) {
        count -= 1
        countLabel.text = "\(count!)"
        
        if count == 0 {
            tapButton.isEnabled = false
            
            let alert = UIAlertController(title: "Cancel", message: "You won", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
            alert.addAction(dismissAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
}
