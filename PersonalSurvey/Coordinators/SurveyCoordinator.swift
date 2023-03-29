import Foundation

final class SurveyCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    deinit {
        print("☠️ DEINIT - Survey Coordinator")
    }
    
    func start() {
        let personalDataVC = PersonalDataViewController()
        router.push(personalDataVC, animated: true)
        
        personalDataVC.onContinueButtonPressed = { [weak self] userData in
            self?.showEmploymentDetailViewController(userData: userData)
        }
    }
    
    private func showEmploymentDetailViewController(userData: UserData) {
        let employmentDetailVC = EmploymentDataViewController()
        self.router.push(employmentDetailVC, animated: true)
        
        employmentDetailVC.onContinueButtonPressed = { [weak self] employmentData in
            self?.showFinishSurveyViewController(userData: userData, employmentData: employmentData)
        }
    }
    
    private func showFinishSurveyViewController(userData: UserData, employmentData: EmploymentData) {
        let finishSurveyVC = FinishSurveyViewController()
        self.router.push(finishSurveyVC, animated: true)
        
        finishSurveyVC.onFinishSurveyButtonPressed = { [weak self] in
            self?.router.popToRootViewController()
        }
        
        finishSurveyVC.onShowSurveyMemmeButtonPressed = { [weak self] in
            self?.showMemmeViewController()
        }
    }
    
    private func showMemmeViewController() {
        let memmeVC = MemmeViewController()
        self.router.present(memmeVC)
        
        memmeVC.onCloseButtonPressed = { [weak self] in
            self?.router.dismiss()
        }
    }
}
