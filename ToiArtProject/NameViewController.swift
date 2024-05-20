//
//  NameViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/16/24.
//

import UIKit
//MARK: - Протоколы используеться переход экран итд

protocol NameViewControllerDelegate: AnyObject {
    func didTabBarController()
    func showErrorAlert(message: String)
}

class NameViewController: UIViewController {
    //MARK: - UI елементы вставляем на экран
    private let NameUI = NameView()
    //MARK: - все функции внутри него работаеть
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    //MARK: - Изменение языка
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NameUI.localizedlanguage()
    }
    //MARK: - помощники
    private func setupHelpers() {
        //MARK: - Цвет экрана
        view.backgroundColor = .systemBackground
        //MARK: - с этим кодом переход экраны начинаеть работать
        NameUI.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    //MARK: - Расположение экран елементов на главный экран
    private func setupConstraints() {
        view.addSubview(NameUI)
        NameUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
//MARK: - Переход экраны
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
