import UIKit
import Combine

final class ApplicationCoordinator: Coordinator {
    private let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    private var subscriptions = Set<AnyCancellable>()
    
    var childCoordinators: [Coordinator] = []
    var router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        setupOnboardingValue()
        
        hasSeenOnboarding.sink { [weak self] hasSeen in
            guard let self else { return }
            
            if hasSeen {
                let startingCoordinator = StartingCoordinator(router: self.router)
                startingCoordinator.start()
                self.childCoordinators = [startingCoordinator]
            } else {
                let onboardingCoordinator = OnboardingCoordinator(router: self.router, hasSeenOnboarding: self.hasSeenOnboarding)
                onboardingCoordinator.start()
                self.childCoordinators = [onboardingCoordinator]
            }
        }
        .store(in: &subscriptions)
    }
    
    func setupOnboardingValue() {
        let key = Constants.UserDefaultsKey.hasSeeOnboarding.rawValue
        let value = UserDefaults.standard.bool(forKey: key)
        
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter { $0 }
            .sink { value in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions)
    }
}
