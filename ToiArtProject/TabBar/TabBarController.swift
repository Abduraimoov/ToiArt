//
//  TabBarController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem.image = image
        return navController
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                viewController: ScheduleViewController(),
                image: UIImage(systemName: "list.bullet.clipboard.fill")
            ),
            generateVC(
                viewController: NoteViewController(),
                image: UIImage(systemName: "note.text")
            ),
            generateVC(
                viewController: MenuViewController(),
                image: UIImage(systemName: "person")
            )
        ]
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 8
        let positionOnY: CGFloat = 13
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height),
            cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.white.cgColor
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.tintColor = UIColor.init(hex: "#00AA00")
        tabBar.unselectedItemTintColor = UIColor.gray
    }
}
