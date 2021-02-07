//
//  Utilities.swift
//  DelaunayTriangulationSwift
//
//  Created by Alex Littlejohn on 2016/01/08.
//  Copyright © 2016 zero. All rights reserved.
//
//  Improved and Extended by Volodymyr Boichentsov on 14/11/2017


#if os(iOS)
    import UIKit
    public typealias OSColor = UIColor
    public typealias OSViewController = UIViewController
#elseif os(OSX)
    import Cocoa
    public typealias OSColor = NSColor
    public typealias OSViewController = NSViewController
#endif

import Delaunay

extension Point {
    public func pointValue() -> CGPoint {
        return CGPoint(x: x, y: y)
    }
}

extension Triangle {
    func v1() -> CGPoint {
        return point1.pointValue()
    }
    
    func v2() -> CGPoint {
        return point2.pointValue()
    }
    
    func v3() -> CGPoint {
        return point3.pointValue()
    }
    
    func toPath() -> CGPath {
        
        let path = CGMutablePath()
        let point1 = self.v1()
        let point2 = self.v2()
        let point3 = self.v3()
        
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.addLine(to: point1)

        path.closeSubpath()
        
        return path
    }
}

extension OSColor {
    
    static func randomColor() -> OSColor {
        let range:Range<CGFloat> = Range<CGFloat>(uncheckedBounds: (lower: 0.0, upper: 1.0))
        let hue = CGFloat.random(in: range) // 0.0 to 1.0
        let saturation: CGFloat = 0.5  // 0.5 to 1.0, away from white
        let brightness: CGFloat = 1.0  // 0.5 to 1.0, away from black
        let color = OSColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        return color
    }
}
