import UIKit

extension UIButton {
    func setupButton(
        title: String,
        titleColor: UIColor = .black,
        background: UIColor = .white,
        cornerRadius: CGFloat = 8
    ) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = cornerRadius
        backgroundColor = background
    }
}
