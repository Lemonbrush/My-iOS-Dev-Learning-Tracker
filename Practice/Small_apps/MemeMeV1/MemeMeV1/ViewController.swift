//
//  ViewController.swift
//  MemeMeV1
//
//  Created by Александр on 15.02.2021.
//

import UIKit

let IMAGE_CORNER_RADIUS: CGFloat = 10

struct Meme {
    var topText: String
    var bottomText: String
    var originalImage: UIImage
    var memeImage: UIImage
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var captureView: UIView!
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var pickButton: UIBarButtonItem!
    @IBOutlet weak var takeAnImageButton: UIBarButtonItem!
    
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var topTextField: UITextField!
    
    let topPlaceholder = "Top text"
    let bottomPlaceholder = "Bottom text"
    
    var activeTextField: UITextField? = nil // To detect if the frame should be moved up with keyboard
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: -6
        ]
        
        topTextField.delegate = self
        topTextField.defaultTextAttributes = textAttributes
        topTextField.textAlignment = .center
        topTextField.text = topPlaceholder
        
        bottomTextField.delegate = self
        bottomTextField.defaultTextAttributes = textAttributes
        bottomTextField.textAlignment = .center
        bottomTextField.text = bottomPlaceholder
        
        imagePickerView.layer.cornerRadius = IMAGE_CORNER_RADIUS
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        subscribeToKeyboardNotifications()
        pickButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        takeAnImageButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: ImagePicker
    @IBAction func pickAnImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePickerView.image = image
            imagePickerView.updateConstraints()
            
            activateShareButton()
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func activateShareButton() {
        let items = toolbar.items!
        for item in items {
            if item.tag == 1 { item.isEnabled = true }
        }
    }
    
    // MARK: Keyboard events handling
    // When the keyboardWillShow notification is received, shift the view's frame up
    @objc func keyboardWillShow(_ notification: Notification) {
        
        var shouldMoveViewUp = false
        
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
            let topOfKeyboard = self.view.frame.height - getKeyboardHeight(notification)
            
            if bottomOfTextField > topOfKeyboard { shouldMoveViewUp = true }
        }
        
        if shouldMoveViewUp {
            self.view.frame.origin.y = 0 - getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    // Helper function gives keyboard hight
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // Of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    // Keyboard notification center
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object:  nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Generate meme image
    func generateMemedImage() -> UIImage {
        
        // Rendering an image in context of text views and returning it
        imagePickerView.layer.cornerRadius = 0
        
        // Render view to an image
        let memedImage = captureView.getImageFromView()
        
        imagePickerView.layer.cornerRadius = IMAGE_CORNER_RADIUS
        
        return memedImage
    }
    
    // MARK: Share
    @IBAction func shareMeme(_ sender: Any) {
        let memedImage = generateMemedImage()
        let activityView = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        present(activityView, animated: true, completion: nil)
    }
}

// MARK: TextField delegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
        
        if textField.text == topPlaceholder || textField.text == bottomPlaceholder { textField.text = "" }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

// Giving UIView an ability to take a snap and return the image
extension UIView {
    func getImageFromView() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { UIGraphicsImageRendererContext in layer.render(in: UIGraphicsImageRendererContext.cgContext) }
    }
}
