//
//  Book+CoreDataProperties.swift
//  LibraryOfAlexandria
//
//  Created by Xinrui Jin on 14/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var author: String?
    @NSManaged public var descr: String?
    @NSManaged public var edition: Int16
    @NSManaged public var genre: String?
    @NSManaged public var isbn: String?
    @NSManaged public var publisher: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    @NSManaged public var bookList: BookList?

}
