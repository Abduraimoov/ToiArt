//
//  MenuView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import SnapKit

class MenuView: UIView {
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    weak var delegate: LanguageViewDelegate?
    
    private let logo_icon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoo")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = .systemFont(ofSize: 20,
                                weight: .medium)
        return view
    }()
    
    private let settingsTableView = UITableView()
    
    
    private let backButton: UIButton = {
        let view = UIButton(type:.system)
        view.setTitleColor(.red,
                           for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 14,
                                            weight: .medium)
        view.backgroundColor = UIColor.init(hex: "#FFBCBC")
        view.layer.cornerRadius = 16
        return view
    }()
    
    weak var protocolMenu: menuViewControllerDelegate?
    
   private var settings: [StructSettings] = [
       StructSettings(title: "Моя информация".localized(),
                      next: "next"),
       StructSettings(title: "Смена языка".localized(),
                      next: "next"),
       StructSettings(title: "Уведомления".localized(),
                      next: "next"),
       StructSettings(title: "Изменение темы".localized(),
                      next: "next"),
       StructSettings(title: "Как работает Toi Art".localized(),
                      next: "next"),
       StructSettings(title: "Пользовательское соглашение".localized(),
                      next: "next"),
       StructSettings(title: "Политика конфиденциальности".localized(),
                      next: "next")
   ]
    
     func updateSettings() {
    settings = [
        StructSettings(title: "Моя информация".localized(),
                       next: "next"),
        StructSettings(title: "Смена языка".localized(),
                       next: "next"),
        StructSettings(title: "Уведомления".localized(),
                       next: "next"),
        StructSettings(title: "Изменение темы".localized(),
                       next: "next"),
        StructSettings(title: "Как работает Toi Art".localized(),
                       next: "next"),
        StructSettings(title: "Пользовательское соглашение".localized(),
                       next: "next"),
        StructSettings(title: "Политика конфиденциальности".localized(),
                       next: "next")
    ]
        settingsTableView.reloadData()
        updateLocalizedTexts()
    }
    
    weak var delegateT: LanguageViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstraints()
        setupAddTardet()
        updateLocalizedTexts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLocalizedTexts() {
        backButton.setTitle("Выйти из аккаунта".localized(),
                      for: .normal)
    }
    
    private func setupAdd() {
        addSubview(logo_icon)
        addSubview(nameLabel)
        addSubview(settingsTableView)
        addSubview(backButton)
    }
    
    private func setupConstraints() {
        logo_icon.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(70)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(logo_icon.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(25)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-25)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(35)
        }
    }
    
    private func setupAddTardet() {
        backButton.addTarget(self,
                             action: #selector(snreenTransilation),
                             for: .touchUpInside)
        settingsTableView.reloadData()
        settingsTableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        settingsTableView.backgroundColor = .none
        settingsTableView.showsVerticalScrollIndicator = false
    }
    
    @objc
    private func snreenTransilation() {
        protocolMenu?.didBackButton()
    }
}

extension MenuView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < settings.count else {
            return UITableViewCell()
        }
        
        let element = settings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsTableViewCell
        cell.backgroundColor = .none
        cell.configure(with: element)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            protocolMenu?.didPresent()
        }
       
        let languageView = LanguageView()
    }
}

