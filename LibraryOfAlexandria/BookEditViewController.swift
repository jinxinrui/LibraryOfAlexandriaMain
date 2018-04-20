//
//  BookEditViewController.swift
//  LibraryOfAlexandria
//
//  Created by Jxr on 20/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit
import CoreData

class BookEditViewController: UIViewController {
    
    
    @IBOutlet weak var editTitle: UITextField!
    
    @IBOutlet weak var editIsbn: UITextField!
    
    @IBOutlet weak var editAuthor: UITextField!
    
    @IBOutlet weak var editPublisher: UITextField!
    
    @IBOutlet weak var editEdition: UITextField!
    
    @IBOutlet weak var editYear: UITextField!
    
    @IBOutlet weak var editGenre: UITextField!
    
    @IBOutlet weak var editDescription: UITextField!
    
    var receivebook: Book?
    
    private var managedObjectContext: NSManagedObjectContext
    
    required init(coder aDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let book = receivebook!

        editTitle.insertText((book.title)!)
        editIsbn.insertText((book.isbn)!)
        editAuthor.insertText((book.author)!)
        editPublisher.insertText((book.publisher)!)
        editEdition.insertText(String(describing: book.edition))
        editYear.insertText(String(describing: book.year))
        editGenre.insertText((book.genre)!)
        editDescription.insertText((book.descr)!)
        // Do any additional setup after loading the view.
    }
    
    // set alert view
    func alert(_ messageString: String) {
        
        let alertController = UIAlertController(title: "Alert", message: messageString, preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title:"Dismiss", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // check if a string only contains numbers
    func isNumeric(_ val: String) -> Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: val))
    }
    
    func ifEmpty(_ val: String, _ message: String) {
        if val.trimmingCharacters(in: .whitespaces).isEmpty {
            let word = "\(message) cannot be empty!"
            alert(word)
        }
    }
    
    func ifNumeric(_ val: String, _ message: String) {
        if !isNumeric(val) {
            let word = "\(message) must be numbers"
            alert(word)
        }
    }
    
    func updateBook() {
        let book = receivebook!
        
        let title = editTitle.text
        let isbn = editIsbn.text
        let author = editAuthor.text
        let publisher = editPublisher.text
        let edition = editEdition.text
        let year = editYear.text
        let genre = editGenre.text
        let descr = editDescription.text
        
//        if ifEmpty(title!) {
//            alert("Title cannot be empty!")
//        } else if ifEmpty(isbn!) {
//            alert("isbn cannot be empty")
//        } else if ifEmpty(author!) {
//            alert("")
//        }
        
        ifEmpty(title!, "Title")
        ifEmpty(isbn!, "ISBN")
        ifEmpty(author!, "Author")
        ifEmpty(publisher!, "Publisher")
        ifEmpty(edition!, "Edition")
        ifEmpty(year!, "Year")
        ifEmpty(genre!, "Genre")
        ifEmpty(descr!, "Description")
        
        ifNumeric(isbn!, "ISBN")
        ifNumeric(edition!, "Edition")
        ifNumeric(year!, "\"Year Of Publication\"")
        
        book.title = title
        book.isbn = isbn
        book.author = author
        book.publisher = publisher
        book.edition = Int16(edition!)!
        book.year = Int16(year!)!
        book.genre = genre
        book.descr = descr
        
//        if editTitle.text != nil {
//            book.title = title
//        }
//        if editIsbn.text != nil {
//            book.isbn = isbn
//        }
//        if editAuthor.text != nil {
//            book.author = author
//        }
//        if editPublisher.text != nil {
//            book.publisher = publisher
//        }
//        if editEdition.text != nil {
//            book.edition = Int16(edition!)!
//        }
//        if editYear.text != nil {
//            book.year = Int16(year!)!
//        }
//        if editGenre.text != nil {
//            book.genre = genre
//        }
//        if editDescription != nil {
//            book.descr = descr
//        }
        
        do {
            try managedObjectContext.save()
        }
        catch let error {
            print("Could not save Core Data: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateConfirmSegue" {
            self.updateBook()
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
