//
//  SpecificationCollectionViewCell.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/15/24.
//

import UIKit
import SnapKit

class SpecificationCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Елементы внутри collection view
    
    static var reuseId = "note_cell"
    
    //MARK: - Создание елементов
    
    private let NameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 19,
                                weight: .semibold)
        view.textColor = .label
        return view
    }()
    
    private let DecpriptionLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let TablesLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let DaysLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let WaitLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()

    //MARK: - Хранение функции чтобы отображать на внутри collection view
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - добавление внутри collection view
    
    private func setupAdd() {
        addSubview(NameLabel)
        addSubview(DecpriptionLabel)
        addSubview(TablesLabel)
        addSubview(DaysLabel)
        addSubview(WaitLabel)
        addSubview(logoImage)
    }
    
    //MARK: - Расположение елементы внутри collection view
    
    private func setupConstraints() {
        NameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(5)
        }
        
        DecpriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(NameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(2)
        }
        
        TablesLabel.snp.makeConstraints { make in
            make.top.equalTo(DecpriptionLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(2)
        }
        
        DaysLabel.snp.makeConstraints { make in
            make.top.equalTo(TablesLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(2)
        }
        
        WaitLabel.snp.makeConstraints { make in
            make.top.equalTo(DaysLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(2)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(120)
        }
    }
    
    //MARK: - Все елементы сможем использовать несколько раз ( вверху создаем и здес напишем код что мы эти елементы использоваем сколько столько хотим )
    
    func configure(with collection: SpecificationCollectionStruct) {
        NameLabel.text = collection.name
        DecpriptionLabel.text = collection.description
        TablesLabel.text = collection.descriptionTables
        DaysLabel.text = collection.descriptionDays
        WaitLabel.text = collection.descriptionWait
        logoImage.image = UIImage(named: collection.image)
    }
}
