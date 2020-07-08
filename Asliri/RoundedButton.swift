import UIKit

@IBDesignable class RoundedImage1: UIImageView
{
    override func layoutSubviews() {
        super.layoutSubviews()

        updateCornerRadius()
    }

    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }

    @IBInspectable var cornerRadius1: CGFloat = 0.1 {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? cornerRadius : 0
        layer.masksToBounds = rounded ? true : false
    }
}

@IBDesignable class RoundedView1: UIView
{
    override func layoutSubviews() {
        super.layoutSubviews()

        updateCornerRadius()
    }

    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }

    @IBInspectable var cornerRadius1: CGFloat = 0.1 {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? cornerRadius : 0
        layer.masksToBounds = rounded ? true : false
    }
}

@IBDesignable class RoundedButton1: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()

        updateCornerRadius()
    }

    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }

    @IBInspectable var cornerRadius1: CGFloat = 0.1 {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? cornerRadius : 0
        layer.masksToBounds = rounded ? true : false
    }
}
