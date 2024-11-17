//
//  Item.swift
//  Todoey
//
//  Created by Олег Дербин on 17.11.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    var parentCategory = LinkingObjects(fromType: Categories.self, property: "items")
}
