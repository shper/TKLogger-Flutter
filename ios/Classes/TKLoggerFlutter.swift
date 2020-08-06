//
//  TKLoggerFlutter.swift
//  Pods-Runner
//
//  Created by Shper on 2020/7/24.
//

import Foundation
import TKLogger

public class TKLoggerFlutter {
    
    private static var destinations = Set<TKLogBaseDestination>()
    
    private init() {
        
    }
    
    // MARK: Destination
    
    @discardableResult
    public static func addDestination(_ destination: TKLogBaseDestination) -> Bool {
        if destinations.contains(destination) {
            return false
        }
        
        destinations.insert(destination)
        return true
    }
    
    // MARK: HandlerLog
    
    static func handlerLog(_ tkLog: TKLogModel) {
        DispatchQueue.global().async {
            destinations.forEach { destination in
                 destination.handlerLog(tkLog)
            }
        }
    }
    
}
