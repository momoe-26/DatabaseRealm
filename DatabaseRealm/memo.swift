//
//  memo.swift
//  DatabaseRealm
//
//  Created by 酒井桃恵 on 2022/04/10.
//

import Foundation
import RealmSwift

class Memo: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
}
