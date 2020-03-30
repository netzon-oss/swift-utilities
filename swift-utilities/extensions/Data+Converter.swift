import Foundation

extension Data {
    var integer: Int {
        return withUnsafeBytes { $0.pointee }
    }
    var uint8: Int8 {
        return withUnsafeBytes { $0.pointee }
    }
    var int32: Int32 {
        return withUnsafeBytes { $0.pointee }
    }
    var float: Float {
        return withUnsafeBytes { $0.pointee }
    }
    var double: Double {
        return withUnsafeBytes { $0.pointee }
    }
    var string: String? {
        return String(data: self, encoding: .utf8)
    }
    var uint16: UInt16 {
        return withUnsafeBytes { $0.pointee }
    }
    var uint16reversed: UInt16 {
        return Data(self.reversed()).uint16
    }
    
//
//  Data+utils.swift
//  nRFMeshProvision
//
//  Created by Mostafa Berg on 22/12/2017.
//
    //Hex string to Data representation
    //Inspired by https://stackoverflow.com/questions/26501276/converting-hex-string-to-nsdata-in-swift
    public init?(hexString: String) {
        let len = hexString.count / 2
        var data = Data(capacity: len)
        for i in 0..<len {
            let j = hexString.index(hexString.startIndex, offsetBy: i*2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
   self = data
    }

    public func hexString() -> String {
        return self.reduce("") { string, byte in
            string + String(format: "%02X", byte)
        }
   }

    func leftPad(length: Int) -> Data {
        guard length > self.count else {
            return self
        }
   
        let paddedData = NSMutableData(capacity: length)!
        paddedData.resetBytes(in: NSRange(location:0, length: length))
        let dataOffset = length - self.count
        let nsData = self as NSData
        let bytes = nsData.bytes
        paddedData.replaceBytes(in: NSRange(location: dataOffset, length: self.count), withBytes: bytes)
        return paddedData as Data
    }
}
