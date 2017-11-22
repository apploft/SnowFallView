//
//  SnowFallView.swift
//  SnowFallView
//
//  Copyright © 2016 Ha Nyung Chung. All rights reserved.
//

import CoreGraphics

public class SnowFallView: UIView {
    
    var isSnowing = false
    
    public var density: Float = 4.0 {
        didSet {
            self.setUpEmitters()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setUp()
    }
    
    public func start() {
        isSnowing = true
        var depth = 0
        
        guard let sublayers = self.layer.sublayers as? [CAEmitterLayer] else {
            return
        }
        
        for emitter in sublayers {
            emitter.birthRate = Float(15 + 5 * depth)
            depth += 1
        }
    }
    
    public func stop() {
        isSnowing = false
        guard let sublayers = self.layer.sublayers as? [CAEmitterLayer] else {
            return
        }
        
        for emitter in sublayers {
            emitter.birthRate = 0
        }
    }
    
    public override func didMoveToSuperview() {
        self.setUpEmitters()
    }
    
    func setUp() {
        self.backgroundColor = .clear
        self.layer.masksToBounds = true
    }
    
    func setUpEmitters() {
        guard self.superview != nil else {
            return;
        }
        
        self.layer.sublayers = nil;
        
        let snowFlake = CAEmitterCell()
        snowFlake.birthRate = self.density
        snowFlake.lifetime = 15
        snowFlake.lifetimeRange = 5.0
        
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "snowflake", in: bundle, compatibleWith: nil)
        
        snowFlake.contents = image?.cgImage
        snowFlake.scale = 1.5 / UIScreen.main.scale
        snowFlake.name = "snowflake"
        snowFlake.velocity = 60
        snowFlake.emissionLongitude = CGFloat(M_PI)
        snowFlake.emissionLatitude = CGFloat(M_PI_4) / 4.0
        snowFlake.spin = 0.7
        
        for i in 0..<3 {
            let emitter = CAEmitterLayer()
            emitter.position = CGPoint(x: self.center.x, y: 0)
            emitter.emitterShape = kCAEmitterLayerLine
            emitter.emitterSize = CGSize(width: self.bounds.width * 1.5, height:1)
            
            let depth = Float(i) / 3.0
            emitter.opacity = 1.0 - depth
            emitter.scale = 1.0 - depth
            emitter.velocity = 1.0 - depth
            emitter.lifetime = 1.0 / (1.0 - depth)
            
            emitter.emitterCells = [snowFlake]
            
            self.layer.addSublayer(emitter)
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        if isSnowing {
            setUpEmitters()
        }
    }
    
    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
}
