import UIKit

final class OnboardingViewController: UIViewController {
    var onStartButtonPressed: (() -> Void)?
    
    // MARK: - Views
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(text: Strings.OnboardingViewController.TitleLabel.title,
                         fontSize: 36,
                         fontWeight: .semibold,
                         textColor: .white,
                         textAlignment: .center)
        return label
    }()
    
    lazy private var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .squareAndPencilCircleFill
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(text: Strings.OnboardingViewController.DescriptionLabel.title,
                         fontSize: 18,
                         fontWeight: .regular,
                         textColor: .white,
                         textAlignment: .left)
        return label
    }()
    
    lazy private var startButton: UIButton = {
        let button = UIButton()
        button.setupButton(title: Strings.OnboardingViewController.StartButton.title)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
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
        view.addSubviews(startButton, titleLabel, descriptionLabel, logoImage)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.width.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottomMargin).offset(-50)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Methods
    @objc private func startButtonTapped() {
        onStartButtonPressed?()
    }
}
