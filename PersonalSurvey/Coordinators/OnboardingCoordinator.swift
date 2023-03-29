import UIKit
import Combine

final class OnboardingCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var router: RouterProtocol

    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>

    init(router: RouterProtocol, hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.router = router
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    deinit {
        print("☠️ DEINIT - Onboarding Coordinator")
    }
    
    func start() {
        let vc = OnboardingViewController()
        router.setRoot(vc, animated: true)
        
        vc.onStartButtonPressed = { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
    }
}
