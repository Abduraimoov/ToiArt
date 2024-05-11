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
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
//        startingUiView.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = "График работы"
    }
    
    private func setupConstrains() {
        view.addSubview(scheduleUI)
        scheduleUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
