//
//  SearchBookTableViewController.swift
//  LibraryOfAlexandria
//
//  Created by Xinrui Jin on 14/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit
import CoreData

class SearchBookTableViewController: UITableViewController, UISearchResultsUpdating {
    
    private var books: [Book] = []
    
    private var filteredList: [Book] = []

    private var managedObjectContext: NSManagedObjectContext
    
    private let SECTION_BOOKS = 0
    private let SECTION_COUNT = 1
    
    required init(coder aDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Book")
        do{
            books = try managedObjectContext.fetch(fetchRequest) as! [Book]
            filteredList = books
        }
            catch {
                fatalError("Failed to fetch books: \(error)")
            }
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search People"
        navigationItem.searchController = searchController
        }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased(), searchText.count > 0 {
            filteredList = filteredList.filter({(book: Book) -> Bool in return
                (book.title?.lowercased().contains(searchText))!
            })
        }
        else {
            filteredList = books
        }
        
        tableView.reloadData()
    }

    func saveData() {
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2 // modified from 0 to 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // added
        if (section == SECTION_COUNT) {
            return 1
        }
        return filteredList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellReuseIdentifier = "BookCell"
        if indexPath.section == SECTION_COUNT {
            cellReuseIdentifier = "TotalCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        // Configure the cell...
        if indexPath.section == SECTION_BOOKS {
            let bookCell = cell as! SearchTableViewCell
            
            bookCell.titleLabel.text = filteredList[indexPath.row].title
            bookCell.authorLabel.text = filteredList[indexPath.row].author
        }
        else {
            cell.textLabel?.text = "\(filteredList.count) Books"
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // warning: incomplete, cannot delte data
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let deletedBook = filteredList.remove(at: indexPath.row)
            managedObjectContext.delete(deletedBook)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.reloadSections([SECTION_COUNT], with: .automatic)
            
            saveData()
        }
    }
        
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
