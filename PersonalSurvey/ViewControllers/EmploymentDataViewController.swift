import UIKit
import Combine

final class EmploymentDataViewController: UIViewController {
    private let viewModel = EmploymentDataViewModel()
    
    private var subscriptions = Set<AnyCancellable>()
    var onContinueButtonPressed: ((EmploymentData) -> Void)?
    
    // MARK: - Views
    private lazy var employerNameTextField: UITextField = {
        let textField = UITextField()
        textField.setupRoundedTextField(placeholderText: Strings.EmploymentDataViewController.EmployerNameTextField.placeholder)
        return textField
    }()
    
    private lazy var jobTitleTextField: UITextField = {
        let textField = UITextField()
        textField.setupRoundedTextField(placeholderText: Strings.EmploymentDataViewController.JobTitleTextField.placeholder)
        return textField
    }()
    
    lazy private var typeOfWorkSegmentedControlLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(text: Strings.EmploymentDataViewController.TypeOfWorkSegmentedControlLabel.title,
                         fontSize: 18,
                         fontWeight: .regular,
                         textColor: .white,
                         textAlignment: .center)
        return label
    }()
    
    lazy private var typeOfWorkSegmentedControl: UISegmentedControl = {
        let segmentedView = UISegmentedControl(items: viewModel.typesOfWork)
        segmentedView.backgroundColor = .white
        segmentedView.layer.cornerRadius = 8
        segmentedView.selectedSegmentIndex = 0
        segmentedView.addTarget(self, action: #selector(typeOfWorkSegmentAction(_:)), for: .valueChanged)
        return segmentedView
    }()
    
    lazy private var companySizeSegmentedControlLabel: UILabel = {
        let label = UILabel()
        label.setupLabel(text: Strings.EmploymentDataViewController.CompanySizeSegmentedControlLabel.title,
                         fontSize: 18,
                         fontWeight: .regular,
                         textColor: .white,
                         textAlignment: .center)
        return label
    }()
    
    lazy private var companySizeSegmentedControl: UISegmentedControl = {
        let segmentedView = UISegmentedControl(items: viewModel.companySizes)
        segmentedView.backgroundColor = .white
        segmentedView.layer.cornerRadius = 8
        segmentedView.selectedSegmentIndex = 0
        segmentedView.addTarget(self, action: #selector(companySegmentAction(_:)), for: .valueChanged)
        return segmentedView
    }()
    
    lazy private var detailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            employerNameTextField,
            jobTitleTextField,
            typeOfWorkSegmentedControlLabel,
            typeOfWorkSegmentedControl,
            companySizeSegmentedControlLabel,
            companySizeSegmentedControl
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    lazy private var continueButton: UIButton = {
        let button = UIButton()
        button.setupButton(title: Strings.EmploymentDataViewController.ContinueButton.title)
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBinding()
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        title = Strings.EmploymentDataViewController.navigationTitle
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
        employerNameTextField.textPublisher
            .sink { [weak self] text in
                guard let self else { return }
                self.viewModel.employerName.send(text)
            }
            .store(in: &subscriptions)
        
        jobTitleTextField.textPublisher
            .sink { [weak self] text in
                guard let self else { return }
                self.viewModel.jobTitle.send(text)
            }
            .store(in: &subscriptions)
    }
    
    // MARK: Methods
    @objc
    private func continueButtonTapped() {
        let employmentData = EmploymentData(employerName: viewModel.employerName.value,
                                            jobTitle: viewModel.jobTitle.value,
                                            companySize: viewModel.companySize.value,
                                            typeOfWork: viewModel.typeOfWork.value)
        onContinueButtonPressed?(employmentData)
    }
    
    @objc
    private func typeOfWorkSegmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.typeOfWork.send(.office)
        case 1:
            viewModel.typeOfWork.send(.hybrid)
        case 2:
            viewModel.typeOfWork.send(.remotely)
        default:
            break
        }
    }
    
    @objc
    private func companySegmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.companySize.send(.small)
        case 1:
            viewModel.companySize.send(.medium)
        case 2:
            viewModel.companySize.send(.large)
        default:
            break
        }
    }
}
