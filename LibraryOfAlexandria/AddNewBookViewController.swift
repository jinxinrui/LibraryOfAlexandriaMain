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
        /*
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Book")
        do {
            bookList = try managedObjectContext.fetch(fetchRequest) as! [Book]
            if bookList.count == 0 {
                addBookData()
                bookList = try managedObjectContext.fetch(fetchRequest) as! [Book]
            }
        }
        catch {
            fatalError("Failed to fetch super heroes: \(error)")
        }
 */

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createDetailSegue" {
            let title = inputTitle.text!
            let isbn = inputIsbn.text!
            let author = inputAuthor.text!
            let publisher = inputPublisher.text!
            let edition = inputEdition.text!
            let year = inputYear.text!
            let genre = inputGenre.text!
            let descr = inputDescr.text!
            
            let detail: [String] = [title, isbn, author, publisher, edition, year, genre, descr]
            if let destinationVC = segue.destination as? createConfirmationViewController {
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
