import UIKit
import Combine

extension UITextField {
    func setupRoundedTextField(placeholderText: String) {
        placeholder = placeholderText
        layer.cornerRadius = 8
        borderStyle = .roundedRect
    }
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }
}

