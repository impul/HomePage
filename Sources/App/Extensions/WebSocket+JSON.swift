//
//  WebSocket+JSON.swift
//  HelloPackageDescription
//
//  Created by Pavlo Boiko on 07.04.18.
//

import Vapor

extension WebSocket {
    func send(_ json: JSON) throws {
        let js = try json.makeBytes()
        try send(js.makeString())
    }
}
