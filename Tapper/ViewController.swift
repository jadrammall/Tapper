//
//  ViewController.swift
//  Tapper
//
//  Created by Jad Rammal on 11/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapsTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playButton.layer.cornerRadius = 12
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func onPlayButtonTap(_ sender: Any) {
        if let text = tapsTextField.text, let count = Int(text) {
            if count > 0 && count < 20 {
                presentGameController(count: count)
            } else {
                showAlert(title: "Dismiss", message: "Number should be between 0 & 20")
            }
        } else {
            showAlert(title: "Error", message: "Please enter a valid number!")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
        alert.addAction(dismissAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentGameController(count: Int) {
        // Step 1: Declare the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Step 2: Declare the destination controller
        let destination = storyboard.instantiateViewController(identifier: "GameViewController") as GameViewController
        
        //Step 3: Send the data
        destination.count = count
        
        //Step 4: Present the destination
        present(destination, animated: true)
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
