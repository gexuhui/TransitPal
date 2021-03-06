//
//  ClipperRefill.swift
//  TransitPal
//
//  Created by Robert Trencheny on 6/4/19.
//  Copyright © 2019 Robert Trencheny. All rights reserved.
//

import Foundation

class ClipperRefill: TransitRefill {
    override init() {}
    
    init?(_ data: Data) {
        super.init()

        let dataArr = [UInt8](data)

        guard let agency = ClipperData.StationsDB?.getOperator(dataArr.toInt(0x2, 2)) else { return nil }

        self.Agency = agency

        self.Timestamp = ClipperTag.convertDate(TimeInterval([UInt8](data).toInt(0x4, 4)))

        self.MachineID = data[8...11].hexEncodedString()
        self.Amount = Int16(dataArr.toInt(0xe, 2))
    }
}
