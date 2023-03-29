import Foundation

final class StartingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var router: RouterProtocol

    init(router: RouterProtocol) {
        self.router = router
    }
    
    deinit {
        print("☠️ DEINIT - Starting Coordinator")
    }
    
    func start() {
        let startingView = StartingViewController()
        router.setRoot(startingView, animated: true)
        
        startingView.onStartButtonPressed = { [weak self] in
            guard let self else { return }
            let surveyCoordinator = SurveyCoordinator(router: self.router)
            surveyCoordinator.start()
            self.childCoordinators = [surveyCoordinator]
        }
    }
}

