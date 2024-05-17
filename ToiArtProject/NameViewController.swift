//
//  NameViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/16/24.
//

import UIKit

protocol NameViewControllerDelegate: AnyObject {
    func didTabBarController()
    func showErrorAlert(message: String)
}

class NameViewController: UIViewController {
    
    private let NameUI = NameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NameUI.localizedlanguage()
    }
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        NameUI.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupConstraints() {
        view.addSubview(NameUI)
        NameUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension NameViewController: NameViewControllerDelegate {
    
    func didTabBarController() {
        let vc = TabBarController()
        if let menuVC = (vc.viewControllers?[3] as? UINavigationController)?.viewControllers.first as? MenuViewController {
            menuVC.name = NameUI.nameTextField.text
        }
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка".localized(), message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Оk", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
