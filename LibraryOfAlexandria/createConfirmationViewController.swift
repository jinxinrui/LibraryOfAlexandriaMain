//
//  createConfirmationViewController.swift
//  LibraryOfAlexandria
//
//  Created by Xinrui Jin on 14/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//

import UIKit

class createConfirmationViewController: UIViewController {
    
    var currentBook = [String]()

    @IBOutlet weak var titleView: UILabel!
    
    @IBOutlet weak var isbnView: UILabel!
    
    @IBOutlet weak var authorView: UILabel!
    
    @IBOutlet weak var publisherView: UILabel!
    
    @IBOutlet weak var editionView: UILabel!
    
    @IBOutlet weak var yearView: UILabel!
    
    @IBOutlet weak var genreView: UILabel!
    
    @IBOutlet weak var descrView: UILabel!
    
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
