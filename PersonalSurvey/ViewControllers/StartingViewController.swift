import UIKit
import SnapKit

final class StartingViewController: UIViewController {
    var onStartButtonPressed: (() -> Void)?
  
    // MARK: - Views
    lazy private var startButton: UIButton = {
        let button = UIButton()
        button.setupButton(title: Strings.StartingViewController.StartButton.title)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy private var memeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.memeImage.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .systemGreen
        view.setGradientBackground()
        view.addSubviews(startButton, memeImage)
        
        memeImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(view.snp.topMargin).offset(20)
        }
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-50)
        }
    }
    
    // MARK: - Methods
    @objc private func startButtonTapped() {
        onStartButtonPressed?()
    }
}
