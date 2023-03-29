import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var router: RouterProtocol { get set }
    func start()
}
