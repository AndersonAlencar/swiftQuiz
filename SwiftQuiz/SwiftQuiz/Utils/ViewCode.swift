//
//  ViewCode.swift
//  SwiftQuiz
//
//  Created by Anderson Alencar on 30/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import Foundation


@objc protocol ViewCode {
    
    func buildHierarchy()
    func setUpConstraints()
    @objc optional func additionalConfigurations()
}

extension ViewCode{
    
    func setUp(){
        buildHierarchy()
        setUpConstraints()
        additionalConfigurations?()
    }
}
