//
//  MenuViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import SnapKit

protocol menuViewControllerDelegate: AnyObject {
    func didBackButton()
    func didPresent()
}

class MenuViewController: UIViewController {
    
    private let menuUI = MenuView()
    
    var name: String? {
        didSet {
            menuUI.name = name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
        updateLocalizedTexts()
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLocalizedTexts()
    }
    
    func updateLocalizedTexts() {
        navigationItem.title = "Профиль".localized()
    }

    private func setupHelpers() {
        menuUI.protocolMenu = self
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
        if let savedName = UserDefaults.standard.string(forKey: "userName") {
            name = savedName
        }
    }
    
    private func setupConstraints() {
        view.addSubview(menuUI)
        menuUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MenuViewController: menuViewControllerDelegate {
    
    func didPresent() {
        let languageView = LanguageView()
        languageView.delegates = self
        let multipler = 0.32
        let customDetent = UISheetPresentationController.Detent.custom(resolver: { context in
            languageView.view.frame.height * multipler
        })
        if let sheet = languageView.sheetPresentationController{
            sheet.detents = [ customDetent,.medium()]
            sheet.prefersGrabberVisible = true
            sheet.prefersPageSizing = true
        }
        present(languageView,
                animated: true)
    }
    
    func didBackButton() {
        let alert = UIAlertController(title: "Выход".localized(),
                                      message: "Вы действительно хотите выйти и удалить все личные данные ?".localized(),
                                      preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Да".localized(), style: .destructive) { [weak self] _ in
            UserDefaults.standard.removeObject(forKey: "userName")
            guard let self = self else { return }
            let vc = StartingViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.setViewControllers([vc], animated: true)
        }
        let noAction = UIAlertAction(title: "Нет".localized(), style: .cancel)
        alert.addAction(acceptAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
}

extension MenuViewController: LanguageViewDelegate {
    func didLanguageSelect(LanguageType: languageType) {
        updateLocalizedTexts()
        menuUI.updateSettings()
        view.setNeedsLayout()
    }
}
