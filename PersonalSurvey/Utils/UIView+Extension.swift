import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func setGradientBackground(topColor: UIColor = .systemGreen, bottomColor: UIColor = Asset.darkGreen.color) {
        let colorTop = topColor.cgColor
        let colorBottom = bottomColor.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
                
        layer.insertSublayer(gradientLayer, at:0)
    }
}
