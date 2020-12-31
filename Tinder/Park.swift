// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let parks = try? newJSONDecoder().decode(Parks.self, from: jsonData)

import Foundation
import SwiftyJSON

struct Parks {

    static var json:JSON {
        if let path = Bundle.main.path(forResource: "NationalParks", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
//                print("jsonData:\(jsonObj)")
                return jsonObj
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        return JSON()
    }
}

