//
//  BookList+CoreDataProperties.swift
//  LibraryOfAlexandria
//
//  Created by Xinrui Jin on 14/4/18.
//  Copyright © 2018 xjin0001. All rights reserved.
//
//

import Foundation
import CoreData


extension BookList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookList> {
        return NSFetchRequest<BookList>(entityName: "BookList")
    }

    @NSManaged public var books: NSSet?

}

// MARK: Generated accessors for books
extension BookList {

    @objc(addBooksObject:)
    @NSManaged public func addToBooks(_ value: Book)

    @objc(removeBooksObject:)
    @NSManaged public func removeFromBooks(_ value: Book)

    @objc(addBooks:)
    @NSManaged public func addToBooks(_ values: NSSet)

    @objc(removeBooks:)
    @NSManaged public func removeFromBooks(_ values: NSSet)

}
