//
//  GCDUtils.swift
//  SampleCode
//
//  Created by Hasan on 10/17/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import Foundation

func inBackground(_ block: @escaping () -> ()) {
    DispatchQueue.global(qos: .default).async {
        block()
    }
}

func onMain(_ block: @escaping () -> ()) {
    DispatchQueue.main.async {
        block()
    }
}
