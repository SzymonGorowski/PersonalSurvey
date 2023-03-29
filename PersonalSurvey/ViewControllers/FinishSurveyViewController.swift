import UIKit

final class FinishSurveyViewController: UIViewController {
    var onShowSurveyMemmeButtonPressed: (() -> Void)?
    var onFinishSurveyButtonPressed: (() -> Void)?

    // MARK: - Views
    
    lazy private var congratsLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(text: Strings.FinishSurveyViewController.CongratsLabel.title,
                         fontSize: 26,
                         fontWeight: .regular,
                         textColor: .white,
                         textAlignment: .center)
        return label
    }()

    lazy private var finishButton: UIButton = {
        let button = UIButton()
        button.setupButton(title: Strings.FinishSurveyViewController.FinishButton.title)
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy private var showSurveyMemmeButton: UIButton = {
        let button = UIButton()
        button.setupButton(title: Strings.FinishSurveyViewController.ShowSurveyMemmeButton.title)
        button.addTarget(self, action: #selector(showSurveyMemmeTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    
    // MARK: - Setup Views
    private func setupViews() {
        title = Strings.FinishSurveyViewController.navigationTitle
        view.setGradientBackground()
        setupNavBar()
        
        view.addSubviews(congratsLabel, finishButton, showSurveyMemmeButton)
        congratsLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(200)
        }
        
        finishButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
        
        showSurveyMemmeButton.snp.makeConstraints { make in
            make.top.equalTo(finishButton.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    // MARK: Methods
    @objc
    private func finishButtonTapped() {
        onFinishSurveyButtonPressed?()
    }
    
    @objc
    private func showSurveyMemmeTapped() {
        onShowSurveyMemmeButtonPressed?()
    }
}
