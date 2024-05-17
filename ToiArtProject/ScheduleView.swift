//
//  ScheduleView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import SnapKit

class ScheduleView: UIView {
    
    private let hoursImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "hours")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    private let hoursLabel: UILabel = {
        let view = UILabel()
        view.text = "10:00 - 19:00"
        view.font = .systemFont(ofSize: 18)
        view.tintColor = .black
        return view
    }()
    
    private let daysLabel: UILabel = {
        let view = UILabel()
        view.text = "Понедельник - воскресенье"
        view.font = .systemFont(ofSize: 18)
        view.textAlignment = .center
        view.tintColor = .black
        return view
    }()
    
    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 16
        return view
    }()
    private let settingsTableView = UITableView()
    
    private var attendanceData: [AttendanceStruct] = []
    
    private let stackButtons: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        view.backgroundColor = UIColor.init(hex: "#00d400")
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 21
        view.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        view.backgroundColor = .systemGray
        view.isEnabled = false
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 21
        view.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return view
    }()
    
    private let dateLabel: UILabel = {
        let view = UILabel()
        view.text = "Дни"
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let startData: UILabel = {
        let view = UILabel()
        view.text = "Пришел"
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let endData: UILabel = {
        let view = UILabel()
        view.text = "Ушел"
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let allHourse: UILabel = {
        let view = UILabel()
        view.text = "Итого"
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstrains()
        setupHelpers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func localizedLanguage() {
        daysLabel.text = "Понедельник - воскресенье".localized()
        dateLabel.text = "Дни".localized()
        startData.text = "Пришел".localized()
        endData.text = "Ушел".localized()
        allHourse.text = "Итого".localized()
    }
    
    private func setupHelpers() {
        settingsTableView.register(AttendanceTableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
        settingsTableView.backgroundColor = .none
        settingsTableView.showsVerticalScrollIndicator = false
    }
    
    private func setupAdd() {
        addSubview(hoursImage)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(hoursLabel)
        stackLabels.addArrangedSubview(daysLabel)
        addSubview(grayView)
        grayView.addSubview(settingsTableView)
        addSubview(stackButtons)
        stackButtons.addArrangedSubview(addButton)
        stackButtons.addArrangedSubview(plusButton)
        grayView.addSubview(dateLabel)
        grayView.addSubview(startData)
        grayView.addSubview(endData)
        grayView.addSubview(allHourse)
    }
    
    private func setupConstrains() {
        
        hoursImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(137)
            make.height.equalTo(140)
        }
        
        stackLabels.snp.makeConstraints { make in
            make.top.equalTo(hoursImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(38)
        }
        
        grayView.snp.makeConstraints { make in
            make.top.equalTo(stackLabels.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-40)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.top).offset(7)
            make.leading.equalToSuperview().offset(22)
        }
        
        startData.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.top).offset(7)
            make.leading.equalTo(dateLabel.snp.trailing).offset(57)
        }
        
        endData.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.top).offset(7)
            make.trailing.equalTo(allHourse.snp.leading).offset(-50)
        }
        
        allHourse.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.top).offset(7)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.top).offset(30)
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalTo(grayView.snp.bottom).offset(-20)
        }
        
        stackButtons.snp.makeConstraints { make in
            make.bottom.equalTo(grayView.snp.bottom).offset(-10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func addButtonTapped() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = dateFormatter.string(from: currentDate)
        dateFormatter.dateFormat = "HH:mm:ss"
        let startDateString = dateFormatter.string(from: currentDate)
        attendanceData.append(AttendanceStruct(date: currentDateString, startData: startDateString, endDate: "", workHour: ""))
        addButton.isEnabled = false
        addButton.backgroundColor = .systemGray
        plusButton.isEnabled = true
        plusButton.backgroundColor = UIColor.init(hex: "#00d400")
        settingsTableView.reloadData()
    }
    
    @objc private func plusButtonTapped() {
        guard attendanceData.count > 0 else { return }
        let lastIndex = attendanceData.count - 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let currentDate = Date()
        let endDateString = dateFormatter.string(from: currentDate)
        attendanceData[lastIndex].endDate = endDateString
        if let startDate = dateFormatter.date(from: attendanceData[lastIndex].startData),
           let endDate = dateFormatter.date(from: endDateString) {
            let workTime = Calendar.current.dateComponents([.hour, .minute, .second], from: startDate, to: endDate)
            let hour = workTime.hour ?? 0
            let minute = workTime.minute ?? 0
            let second = workTime.second ?? 0
            attendanceData[lastIndex].workHour = String(format: "%02d:%02d:%02d", hour, minute, second)
        }
        plusButton.isEnabled = false
        plusButton.backgroundColor = .gray
        addButton.isEnabled = true
        addButton.backgroundColor = UIColor.init(hex: "#00d400")
        settingsTableView.reloadData()
    }
}

extension ScheduleView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attendanceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < attendanceData.count else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AttendanceTableViewCell
        cell.configure(with: attendanceData[indexPath.row])
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            attendanceData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

