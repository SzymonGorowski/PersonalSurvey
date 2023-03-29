import UIKit
import SnapKit
import Combine

final class PersonalDataViewController: UIViewController {
    private let viewModel = PersonalDataViewModel()
    
    private var subscriptions = Set<AnyCancellable>()
    var onContinueButtonPressed: ((UserData) -> Void)?

    // MARK: - Views
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.setupRoundedTextField(placeholderText: Strings.PersonalDataViewController.EmailTextField.placeholder)
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.setupRoundedTextField(placeholderText: Strings.PersonalDataViewController.NameTextField.placeholder)
        return textField
    }()
    
    lazy private var agePickerLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(text: Strings.PersonalDataViewController.AgePickerLabel.title,
                         fontSize: 18,
                         fontWeight: .regular,
                         textColor: .white,
                         textAlignment: .center)
        return label
    }()
    
    lazy private var agePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white.withAlphaComponent(0.25)
        pickerView.layer.cornerRadius = 8
        return pickerView
    }()
    
    lazy private var genderSegmentedControlLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(text: Strings.PersonalDataViewController.GenderSegmentedControlLabel.title,
                         fontSize: 18,
                         fontWeight: .regular,
                         textColor: .white,
                         textAlignment: .center)
        return label
    }()
    
    lazy private var genderSegmentedControl: UISegmentedControl = {
        let segmentedView = UISegmentedControl(items: [Gender.female.rawValue.capitalized,
                                                       Gender.male.rawValue.capitalized,
                                                       Gender.other.rawValue.capitalized])
        segmentedView.backgroundColor = .white
        segmentedView.layer.cornerRadius = 8
        segmentedView.selectedSegmentIndex = 0
        segmentedView.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        return segmentedView
    }()
    
    lazy private var detailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nameTextField,
            emailTextField,
            agePickerLabel,
            agePickerView,
            genderSegmentedControlLabel,
            genderSegmentedControl]
        )
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    lazy private var continueButton: UIButton = {
        let button = UIButton()
        button.setupButton(title: Strings.PersonalDataViewController.ContinueButton.title)
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBinding()
        agePickerView.delegate = self
        agePickerView.dataSource = self
    }
    
    
    // MARK: - Setup Views
    private func setupViews() {
        title = Strings.PersonalDataViewController.navigationTitle
        view.setGradientBackground()
        setupNavBar()
        
        view.addSubviews(detailsStackView, continueButton)
        detailsStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    // MARK: Setup Binding
    private func setupBinding() {
        nameTextField.textPublisher
            .sink { [weak self] text in
                guard let self else { return }
                self.viewModel.name.send(text)
            }
            .store(in: &subscriptions)
        
        emailTextField.textPublisher
            .sink { [weak self] text in
                guard let self else { return }
                self.viewModel.email.send(text)
            }
            .store(in: &subscriptions)
    }
    
    // MARK: Methods
    @objc
    private func continueButtonTapped() {
        if viewModel.name.value.isEmpty || viewModel.email.value.isEmpty {
            presentAlert()
        } else {
            let userData = UserData(name: viewModel.name.value,
                                    email: viewModel.email.value,
                                    age: viewModel.age.value,
                                    gender: viewModel.gender.value)
            onContinueButtonPressed?(userData)
        }
    }
    
    @objc
    private func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.gender.send(.female)
        case 1:
            viewModel.gender.send(.male)
        case 2:
            viewModel.gender.send(.other)
        default:
            break
        }
    }
    
    private func presentAlert() {
        let alert = UIAlertController(title: Strings.PersonalDataViewController.Alert.title,
                                      message: Strings.PersonalDataViewController.Alert.message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: Strings.PersonalDataViewController.Alert.button,
                                      style: .default,
                                      handler: { _ in
        }))

        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: Delegates
extension PersonalDataViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.ageRange.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(viewModel.ageRange[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: "\(viewModel.ageRange[row])", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.age.send(viewModel.ageRange[row])
    }
}
