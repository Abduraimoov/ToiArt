//
//  HomeView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Все UI часть, верстка
    
    private let programmLabel: UILabel = {
        let view = UILabel()
        view.text = "Наши программы"
        view.font = .systemFont(ofSize: 17,
                                weight: .medium)
        view.textColor = UIColor.init(hex: "#0093B2")
        return view
    }()
    
    private let potteryLabel: UILabel = {
        let view = UILabel()
        view.text = "Гончарные программы"
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private lazy var specificationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 40
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(SpecificationCollectionViewCell.self,
                      forCellWithReuseIdentifier: SpecificationCollectionViewCell.reuseId)
        return view
    }()
    
    //MARK: - Заполнение елементы collectionView
    
    private var CollectionElements: [SpecificationCollectionStruct] = [
        SpecificationCollectionStruct(name: "Стандарт ⭐".localized(),
                                      description: "• 1,5 часа 1400".localized(),
                                      descriptionTables: "• 1-изделия за столом".localized(),
                                      descriptionDays: "• 2-изделия на гончарке".localized(),
                                      descriptionWait: "• Оба изделия с 1 обжигон".localized(),
                                      image: "image1"),
        SpecificationCollectionStruct(name: "Silver ⭐⭐".localized(),
                                      description: "• 1,5 часа 1700".localized(),
                                      descriptionTables: "• 1-изделия за столом".localized(),
                                      descriptionDays: "• 2-изделия на гончарке".localized(),
                                      descriptionWait: "• 1-изделие с обжигом в 2 этаже".localized(),
                                      image: "imagee"),
        SpecificationCollectionStruct(name: "Gold ⭐⭐⭐".localized(),
                                      description: "• Взрослый 2500 (от 12 лет).localized()",
                                      descriptionTables: "• 2 изделия на гончарке".localized(),
                                      descriptionDays: "• Роспись 2x изделии (2-день)".localized(),
                                      descriptionWait: "• Обжиг в 2 этаже всех издалии".localized(),
                                      image: "imageeeees"),
        SpecificationCollectionStruct(name: "Свидание ❤️❤️".localized(),
                                      description: "• 4000 группе 2x чел".localized(),
                                      descriptionTables: "• 1 изделие на каждого чел".localized(),
                                      descriptionDays: "• 1 изделие на ганчорном круге".localized(),
                                      descriptionWait: "• изделие на за столом".localized(),
                                      image: "image3"),
        
    ]
    //MARK: - Хранение функции чтобы отображать на экран
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Изменение языка елементы Collection View
    
    func localizableLanguage() {
        CollectionElements = [
            SpecificationCollectionStruct(name: "Стандарт ⭐",
                                          description: "• 1,5 часа 1400".localized(),
                                          descriptionTables: "• 1-изделия за столом".localized(),
                                          descriptionDays: "• 2-изделия на гончарке".localized(),
                                          descriptionWait: "• Оба изделия с 1 обжигон".localized(),
                                          image: "image1"),
            SpecificationCollectionStruct(name: "Серебро ⭐⭐".localized(),
                                          description: "• 1,5 часа 1700".localized(),
                                          descriptionTables: "• 1-изделия за столом".localized(),
                                          descriptionDays: "• 2-изделия на гончарке".localized(),
                                          descriptionWait: "• 1-изделие с обжигом в 2 этаже".localized(),
                                          image: "imagee"),
            SpecificationCollectionStruct(name: "Золото ⭐⭐⭐".localized(),
                                          description: "• Взрослый 2500 (от 12 лет)".localized(),
                                          descriptionTables: "• 2 изделия на гончарке".localized(),
                                          descriptionDays: "• Роспись 2x изделии (2-день)".localized(),
                                          descriptionWait: "• Обжиг в 2 этаже всех издалии".localized(),
                                          image: "imageeeees"),
            SpecificationCollectionStruct(name: "Свидание ❤️❤️".localized(),
                                          description: "• 4000 группе 2x чел".localized(),
                                          descriptionTables: "• 1 изделие на каждого чел".localized(),
                                          descriptionDays: "• 1 изделие на ганчорном круге".localized(),
                                          descriptionWait: "• изделие на за столом".localized(),
                                          image: "image3"),
            SpecificationCollectionStruct(name: "Свидание ❤️❤️".localized(),
                                          description: "• 4000 группе 2x чел".localized(),
                                          descriptionTables: "• 1 изделие на каждого чел".localized(),
                                          descriptionDays: "• 1 изделие на ганчорном круге".localized(),
                                          descriptionWait: "• изделие на за столом".localized(),
                                          image: "image3"),
            SpecificationCollectionStruct(name: "Свидание ❤️❤️".localized(),
                                          description: "• 4000 группе 2x чел".localized(),
                                          descriptionTables: "• 1 изделие на каждого чел".localized(),
                                          descriptionDays: "• 1 изделие на ганчорном круге".localized(),
                                          descriptionWait: "• изделие на за столом".localized(),
                                          image: "image3")
        ]
        programmLabel.text = "Наши программы".localized()
        potteryLabel.text = "Гончарные программы".localized()
    }
    //MARK: - добавить елементы на экран
    
    private func setupAdd() {
        addSubview(programmLabel)
        addSubview(potteryLabel)
        addSubview(specificationCollectionView)
    }
    
    //MARK: - Констреинты елементы, расположения
    
    private func setupConstraints() {
        programmLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
        
        potteryLabel.snp.makeConstraints { make in
            make.top.equalTo(programmLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
        }
        
        specificationCollectionView.snp.makeConstraints { make in
            make.top.equalTo(potteryLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
        }
    }
}
//MARK: - Отоброжения на экран, елементы Collection view

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionElements.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecificationCollectionViewCell.reuseId, for: indexPath) as? SpecificationCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: CollectionElements[indexPath.row])
        return cell
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 12) / 1 , height: 100)
    }
}
