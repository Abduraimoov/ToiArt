//
//  SettingsTableViewCell.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/14/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    private let elementsLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let nextImage = UIImageView()
    
    private let cellId = "cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAdd()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAdd() {
        addSubview(elementsLabel)
        addSubview(nextImage)
    }
    
    private func setupConstrains() {
        elementsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(25)
        }
        
        nextImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(14)
            make.width.equalTo(9)
        }
    }
    
    func configure(with elements: StructSettings) {
        elementsLabel.text = elements.title
        nextImage.image = UIImage(named: elements.next)
    }
}
