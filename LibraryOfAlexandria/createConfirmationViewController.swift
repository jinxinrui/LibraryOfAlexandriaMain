//
//  createConfirmationViewController.swift
//  LibraryOfAlexandria
//
//  Created by Xinrui Jin on 14/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit
import CoreData

protocol AddBookProtocol {
    func addBook(book: Book) -> Bool
}

class createConfirmationViewController: UIViewController {
    
    private var bookList: [Book] = []
    private var managedObjectContext: NSManagedObjectContext
    var addBookDelegate: AddBookProtocol?
    
    required init(coder aDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: aDecoder)!
    }
    
    var currentBook = [String]()

    @IBOutlet weak var titleView: UILabel!
    
    @IBOutlet weak var isbnView: UILabel!
    
    @IBOutlet weak var authorView: UILabel!
    
    @IBOutlet weak var publisherView: UILabel!
    
    @IBOutlet weak var editionView: UILabel!
    
    @IBOutlet weak var yearView: UILabel!
    
    @IBOutlet weak var genreView: UILabel!
    
    @IBOutlet weak var descrView: UILabel!
    
    /*
     viewWillAppear method is called on a View Controller just before that
     view appears on the screen. All it does (in this
     case) is look at the currentBook property (which we set in the prepareForSegue method in the AddNewBookViewController
     before the page loaded) and set the text for the labels to the correct values
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // setup labels
        titleView.text = currentBook[0]
        isbnView.text = currentBook[1]
        authorView.text = currentBook[2]
        publisherView.text = currentBook[3]
        editionView.text = currentBook[4]
        yearView.text = currentBook[5]
        genreView.text = currentBook[6]
        descrView.text = currentBook[7]
        
    }
    
    func addBookData() {
        let book = NSEntityDescription.insertNewObject(forEntityName: "Book", into: managedObjectContext) as! Book
        book.title = currentBook[0]
        book.isbn = currentBook[1]
        book.author = currentBook[2]
        book.publisher = currentBook[3]
        book.edition = Int16(currentBook[4])!
        book.year = Int16(currentBook[5])!
        book.genre = currentBook[6]
        book.descr = currentBook[7]
        
        do {
            try managedObjectContext.save()
        }
        catch let error {
            print("Could not save Core Data: \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // add book to CoreData
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addBookSegue" {
            self.addBookData()
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
