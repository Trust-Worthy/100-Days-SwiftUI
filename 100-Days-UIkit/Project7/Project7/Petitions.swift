//
//  Petitions.swift
//  Project7
//
//  Created by Trust-Worthy on 9/9/25.
//

import Foundation


struct Petitions: Codable {
    // only property also conforms to codeable based on the petition json data
    var result: [Petition]
}
