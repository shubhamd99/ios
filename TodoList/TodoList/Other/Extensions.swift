//
//  Extensions.swift
//  TodoList
//
//  Created by shubham.dhage on 11/05/24.
//

import Foundation

// [:] -> Emptty Dictionary
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
