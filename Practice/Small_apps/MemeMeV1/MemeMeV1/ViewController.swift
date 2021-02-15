//
//  ViewController.swift
//  MemeMeV1
//
//  Created by Александр on 15.02.2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var pickButton: UIBarButtonItem!
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    var memeTextDelegate: MemeTextFieldDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memeTextDelegate = MemeTextFieldDelegate()
        topTextField.delegate = memeTextDelegate
        topTextField.textAlignment = .center
        
        bottomTextField.delegate = memeTextDelegate
        bottomTextField.textAlignment = .center
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        pickButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
    }

    @IBAction func pickAnImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        //pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Canceled")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePickerView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

