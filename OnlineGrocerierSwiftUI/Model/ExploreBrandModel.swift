//
//  ExploreBrandModel.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 08.02.2024.
//

import SwiftUI

struct ExploreBrandModel: Identifiable, Equatable {
    var id: Int = 0
    var name: String = ""
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "brand_id") as? Int ?? 0
        self.name = dict.value(forKey: "brand_name") as? String ?? ""
    }
    
    static func == (lhs: ExploreBrandModel, rhs: ExploreBrandModel) -> Bool {
        return lhs.id == rhs.id
    }
}
