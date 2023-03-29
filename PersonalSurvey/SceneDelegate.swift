import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var applicationCoordinator: ApplicationCoordinator?
    private var router: Router?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        let navVC = UINavigationController()
        let router = Router(rootController: navVC)

        window.rootViewController = navVC
        
        self.router = router
        self.applicationCoordinator = ApplicationCoordinator(router: router)
        self.applicationCoordinator?.start()
        self.window = window
        
        window.makeKeyAndVisible()
    }
}
