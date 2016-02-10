//
//  Annotation.swift
//  DropDownList
//
//  Created by Singh, Surendra on 2/10/16.
//  Copyright © 2016 Singh, Surendra. All rights reserved.
//

import Foundation
import UIKit

public class Annotation : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override public func drawRect(rect: CGRect) {
        
        let ctx : CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect))
        CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect))
        CGContextAddLineToPoint(ctx, (CGRectGetMaxX(rect)/2.0), CGRectGetMinY(rect))
        CGContextClosePath(ctx)
        
        CGContextSetRGBFillColor(ctx, 0.0, 0.0, 0.0,1.0);
        CGContextFillPath(ctx);
    }
} 
