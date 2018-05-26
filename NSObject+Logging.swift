//
//  NSObject+Logging.swift
//  GDXRepo
//
//  Created by Георгий Малюков on 26.05.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

extension NSObject {
    
    var typenameFull: String {
        return NSStringFromClass(type(of: self))
    }
    
    var typename: String {
        let full = NSStringFromClass(type(of: self))
        return full.regexReplace(pattern: "^[^\\.]+\\.", replace: "")
    }
    
    func d(_ string: String) {
        if let symbol = CallStackParser.classAndMethodForStackSymbol(Thread.callStackSymbols[1]) {
            print("[\(symbol.0)] \(symbol.1) \(string)")
        }
        else {
            print("[\(typename)] \(#function)] \(string)")
        }
    }
    
}