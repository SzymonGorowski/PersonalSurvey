import UIKit

protocol RouterProtocol {
    var rootChildren: [UIViewController] { get }
    var rootController: UINavigationController? { get }
    
    func present(_ vc: UIViewController)
    func push(_ vc: UIViewController, animated: Bool)
    func setRoot(_ vc: UIViewController, animated: Bool)
    func dismiss()
    func popToRootViewController()
}

final class Router: RouterProtocol {
    var rootChildren: [UIViewController] { rootController?.children ?? [] }
    
    var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func present(_ vc: UIViewController) {
        rootController?.present(vc, animated: true)
    }
    
    func push(_ vc: UIViewController, animated: Bool) {
        rootController?.pushViewController(vc, animated: animated)
    }
    
    func setRoot(_ vc: UIViewController, animated: Bool) {
        rootController?.setViewControllers([vc], animated: animated)
    }
    
    func dismiss() {
        rootController?.dismiss(animated: true)
    }
    
    func popToRootViewController() {
        self.rootController?.popToRootViewController(animated: true)
    }
}
