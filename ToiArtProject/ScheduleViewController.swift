//
//  ScheduleViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import SnapKit

class ScheduleViewController: UIViewController {
    
    private let scheduleUI = ScheduleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLocalizable()
    }
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupLocalizable() {
        navigationItem.title = "График работы".localized()
        scheduleUI.localizedLanguage()
    }
    
    private func setupConstrains() {
        view.addSubview(scheduleUI)
        scheduleUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

