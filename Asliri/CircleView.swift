import UIKit

class CircleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutOvalMask()
    }

    private func layoutOvalMask() {
        frame = self.frame
        let mask = self.shapeMaskLayer()
        let bounds = self.bounds
        if mask.frame != bounds {
            mask.frame = bounds
            mask.path = CGPath(ellipseIn: bounds, transform: nil)
        }
    }

    private func shapeMaskLayer() -> CAShapeLayer {
        if let layer = self.layer.mask as? CAShapeLayer {
            return layer
        }
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.white.cgColor
        self.layer.mask = layer
        return layer
    }
    
    var progressLyr = CAShapeLayer()
    var trackLyr = CAShapeLayer()
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       makeCircularPath()
    }
    
    var progressClr = UIColor.white {
       didSet {
          progressLyr.strokeColor = progressClr.cgColor
       }
    }
    
    var trackClr = UIColor.white {
       didSet {
          trackLyr.strokeColor = trackClr.cgColor
       }
    }
    
    func makeCircularPath() {
       self.backgroundColor = UIColor.clear
//       self.layer.cornerRadius = self.frame.size.width/2
//        self.layer.cornerRadius = rounded ? cornerRadius : 0
//        self.layer.masksToBounds = rounded ? true : false

        let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 300, height: 350))

        
       trackLyr.path = circlePath.cgPath
       trackLyr.fillColor = UIColor.clear.cgColor
       trackLyr.strokeColor = trackClr.cgColor
       trackLyr.lineWidth = 15.0
       trackLyr.strokeEnd = 1.0
       layer.addSublayer(trackLyr)
       progressLyr.path = circlePath.cgPath
       progressLyr.fillColor = UIColor.clear.cgColor
       progressLyr.strokeColor = progressClr.cgColor
       progressLyr.lineWidth = 10.0
       progressLyr.strokeEnd = 0.0
       layer.addSublayer(progressLyr)
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
       let animation = CABasicAnimation(keyPath: "strokeEnd")
       animation.duration = duration
       animation.fromValue = value
       animation.toValue = value
        print("valuenya : ",value)
        print("duration :",duration)
       animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
       progressLyr.strokeEnd = CGFloat(value)
       progressLyr.add(animation, forKey: "animateprogress")
    }
}
