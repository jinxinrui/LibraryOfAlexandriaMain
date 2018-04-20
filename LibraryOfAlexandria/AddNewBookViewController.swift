//
//  AddNewBookViewController.swift
//  LibraryOfAlexandria
//
//  Created by Jxr on 11/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit

class AddNewBookViewController: UIViewController {
    
    @IBOutlet weak var inputTitle: UITextField!
    
    @IBOutlet weak var inputIsbn: UITextField!
    
    @IBOutlet weak var inputAuthor: UITextField!
    
    @IBOutlet weak var inputPublisher: UITextField!
    
    @IBOutlet weak var inputEdition: UITextField!
    
    @IBOutlet weak var inputYear: UITextField!
    
    @IBOutlet weak var inputGenre: UITextField!
    
    @IBOutlet weak var inputDescr: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // validate the textField
        let title = inputTitle.text!
        let isbn = inputIsbn.text!
        let author = inputAuthor.text!
        let publisher = inputPublisher.text!
        let edition = inputEdition.text!
        let year = inputYear.text!
        let genre = inputGenre.text!
        let descr = inputDescr.text!
        
        func alert(_ messageString: String) {
            
            let alertController = UIAlertController(title: "Alert", message: messageString, preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title:"Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        func isNumeric(_ val: String) -> Bool {
            return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: val))
        }
        
        func ifEmpty(_ val: String) -> Bool {
            return val.trimmingCharacters(in: .whitespaces).isEmpty
        }
        
        if ifEmpty(title) || ifEmpty(isbn) || ifEmpty(author) || ifEmpty(publisher) || ifEmpty(edition) || ifEmpty(year) || ifEmpty(genre) || ifEmpty(descr) {
            alert("Not all fields are filled in!")
        } else if !isNumeric(isbn) {
            alert("ISBN shoule be numbers!")
        } else if isbn.count != 10 {
            alert("ISBN should consist of 10 digits")
        }else if !isNumeric(edition) {
            alert("Edition should be numbers")
        } else if Int(edition)! >= 10 || Int(edition)! <= 0 {
            alert("Edition should locates within [1,10]")
        } else if !isNumeric(year) {
            alert("\"Year Of Publication\" should be numbers")
        } else if Int(year)! < 1800 || Int(year)! > 2018 {
            alert("\"Year Of Publication\" should be within [1800, 2018]")
        }
 
        
        if segue.identifier == "createDetailSegue" {

            let detail: [String] = [title, isbn, author, publisher, edition, year, genre, descr]
            if let destinationVC = segue.destination as? createConfirmationViewController {
                // currentBook defined in createConfirmationViewController
                destinationVC.currentBook = detail
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
