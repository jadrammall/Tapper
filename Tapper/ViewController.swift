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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tapsTextField.text != nil else {
            return
        }
        let selectedNumber = Int(tapsTextField.text ?? "0")
        let gameVC = segue.destination as! GameViewController
        gameVC.count = selectedNumber
    }
    
    @IBAction func onPlayButtonTap(_ sender: Any) {
        if let text = tapsTextField.text, let count = Int(text) {
            play()
        } else {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Please enter a valid number!", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func play() {
        
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
