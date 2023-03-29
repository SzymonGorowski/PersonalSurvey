import UIKit

final class MemmeViewController: UIViewController {
    var onCloseButtonPressed: (() -> Void)?
    
    // MARK: - Views
    lazy private var memeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.surveyMemeImage.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy private var closeButton: UIButton = {
        let button = UIButton()
        button.setupButton(title: Strings.MemmeViewController.CloseButton.title)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.setGradientBackground()
        setupNavBar()
        
        view.addSubviews(memeImage, closeButton)
        memeImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        closeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    // MARK: Methods
    @objc
    private func closeButtonTapped() {
        onCloseButtonPressed?()
    }
}
