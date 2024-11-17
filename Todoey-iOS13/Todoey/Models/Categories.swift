//
//  Categories.swift
//  Todoey
//
//  Created by Олег Дербин on 17.11.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Categories: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
