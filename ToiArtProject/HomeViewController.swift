//
//  HomeViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 4/30/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeUI = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }

    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
        navigationItem.hidesBackButton = true
        navigationItem.title = "Home"
        let image = UIImage(named: "logoo")
        let imageView = UIImageView(image: image)
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(34)
        }
        let imageItem = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = imageItem
    }
    
    private func setupConstraints() {
        view.addSubview(homeUI)
        homeUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }


}

