//
//  MenuViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit

class MenuViewController: UIViewController {
    
    private let menuUI = MenuView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }

    private func setupHelpers() {
        view.backgroundColor = .systemBackground

        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = "График работы"
    }
    
    private func setupConstraints() {
        view.addSubview(menuUI)
        menuUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
