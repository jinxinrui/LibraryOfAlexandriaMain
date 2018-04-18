//
//  BookDetailViewController.swift
//  LibraryOfAlexandria
//
//  Created by Jxr on 18/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var isbnLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var publisherLabel: UILabel!
    
    @IBOutlet weak var editionLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var descrLabel: UILabel!
    
    var currentBook: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // setup labels
        titleLabel.text = currentBook[0]
        isbnLabel.text = currentBook[1]
        authorLabel.text = currentBook[2]
        publisherLabel.text = currentBook[3]
        editionLabel.text = currentBook[4]
        yearLabel.text = currentBook[5]
        genreLabel.text = currentBook[6]
        descrLabel.text = currentBook[7]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
