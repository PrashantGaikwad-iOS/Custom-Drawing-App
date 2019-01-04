//
//  Canvas.swift
//  Custom Drawing App
//
//  Created by Prashant G on 1/4/19.
//  Copyright © 2019 Prashant G. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        // Custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        // Dummy data
        //        let startPoint = CGPoint(x:0,y:0)
        //        let endPoint = CGPoint(x:100,y:100)
        //
        //        context.move(to: startPoint)
        //        context.addLine(to: endPoint)
        
        //        line.forEach { (point) in
        //            //
        //        }
        context.setStrokeColor(UIColor.brown.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.round)
        
        lines.forEach { (line) in
            for (i,point) in line.enumerated() {
                if i == 0 {
                    context.move(to: point)
                }
                else{
                    context.addLine(to: point)
                }
            }
        }
        context.strokePath()
    }
    
    //    var line = [CGPoint]()
    var lines = [[CGPoint]]()
    //track the finger as we move across the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        //        print(point)
        //        line.append(point)
        
        guard var lastLine = lines.popLast() else {
            return
        }
        lastLine.append(point)
        lines.append(lastLine)
        
        //        var lastLine = lines.last
        //        lastLine?.append(point)
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
}
