//
//  String+Truncate.swift
//  HelloPackageDescription
//
//  Created by Pavlo Boiko on 07.04.18.
//

import Foundation

extension String {
    func truncated(to max: Int) -> String {
        if count > max {
            return substring(
                to: index(
                    startIndex,
                    offsetBy: max
                )
            )
        }
        
        return self
    }
}
