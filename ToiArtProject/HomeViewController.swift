//
//  HomeViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 4/30/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    //MARK: - Вызываем все UI на экран
    
    private let homeUI = HomeView()

    //MARK: - Хранение всех функции
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    //MARK: - Изменение языка
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLocalizable()
    }
    
    //MARK: - Функция для улучшении

    private func setupHelpers() {
        //MARK: - цвет экрана
        view.backgroundColor = .systemBackground
        
        //MARK: - Цвет navigationItem.title
        navigationItem.title = "Главная"
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
        //MARK: - Скрываеть кнопку назад
        
        navigationItem.hidesBackButton = true
        //MARK: - Добавления логотип верхний левом углу
        let image = UIImage(named: "logoo")
        let imageView = UIImageView(image: image)
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(34)
        }
        let imageItem = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = imageItem
    }
    
    //MARK: - Изменение языка всех елементов
    private func setupLocalizable() {
        navigationItem.title = "Главная".localized()
        homeUI.localizableLanguage()
    }
    
    //MARK: -  Констреинт экрана елементов
    private func setupConstraints() {
        view.addSubview(homeUI)
        homeUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
