//
//  NoteViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit

protocol NoteViewProtocol {
    func succesNotes(notes: [Note])
}

class NoteViewController: UIViewController {
    
    private var controller: NoteControllerProtocol?
    
    var noteService = CoreDataService.shared
    
    private var notes: [Note] = []
    
    private lazy var noteSearchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.backgroundImage = UIImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.searchTextField.addTarget(self, action: #selector(noteSearchBarEditingChanged), for: .editingChanged)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Notes"
        view.font = UIFont.systemFont(ofSize: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var notesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(NoteCell.self, forCellWithReuseIdentifier: NoteCell.reuseId)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        view.backgroundColor = UIColor.init(hex: "#00d400")
        view.setTitleColor(.white, for: .normal)
        view.layer.cornerRadius = 21
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(NewNotesTapped), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        updateInterfaceForTheme()
        setupCollectionView()
        setupButton()
        controller = NoteController(view: self)
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.bool(forKey: "Theme") == false {
            view.overrideUserInterfaceStyle = .light
        } else {
            view.overrideUserInterfaceStyle = .dark
        }
        controller?.onGetNotes()
        setupLocaliazble()
    }
    
    private func setupLocaliazble() {
        let backButton = UIBarButtonItem()
        backButton.title = "".localized()
        navigationItem.backBarButtonItem = backButton
        noteSearchBar.placeholder = "Поиск".localized()
        titleLabel.text = "Заметки".localized()
        navigationItem.title = "Заметки".localized()
        let rightBarButtonItem = UIBarButtonItem(title: "Удалить".lowercased(), style: .plain, target: self, action: #selector(handleDeleteNotes))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func updateInterfaceForTheme(isDark: Bool? = nil) {
        if let isDark = isDark {
            UserDefaults.standard.set(isDark, forKey: "Theme")
        }
        let isDarkMode = UserDefaults.standard.bool(forKey: "Theme")
        navigationController?.navigationBar.tintColor = isDarkMode ? .white : UIColor.init(hex: "#0093B2")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: isDarkMode ? UIColor.white : UIColor.black]
        navigationItem.rightBarButtonItem?.tintColor = isDarkMode ? .white : .blue
    }
    
    private func setupUI() {
        view.addSubview(noteSearchBar)
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            noteSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            noteSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noteSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noteSearchBar.heightAnchor.constraint(equalToConstant: 36),
            
            titleLabel.topAnchor.constraint(equalTo: noteSearchBar.bottomAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(notesCollectionView)
        NSLayoutConstraint.activate([
            notesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            notesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            notesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            notesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupButton() {
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 42),
            addButton.widthAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    @objc func NewNotesTapped() {
        let noteView = NewNotesView()
        navigationController?.pushViewController(noteView, animated: true)
    }
    
    @objc func noteSearchBarEditingChanged() {
        controller?.onNoteSearching(text: noteSearchBar.text ?? "")
    }
    
    
    @objc private func handleDeleteNotes() {
        
        let alert = UIAlertController(title: "Удалить".localized(), message: "Вы действительно хотите удалить всю заметку ?".localized(), preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Yes".localized(), style: .destructive) { action in
            self.deleteNotes()
        }
        
        let actionDecline = UIAlertAction(title: "No".localized(), style: .cancel)
        
        alert.addAction(actionDecline)
        alert.addAction(acceptAction)
        
        present(alert, animated: true)
    }
    
    
    private let coreDataservice = CoreDataService.shared
    
    func deleteNotes() {
        coreDataservice.deleteNotes { response in
            if response == .success {
                self.succesDelete()
            } else {
                self.failureDelete()
            }
        }
    }
    
    func succesDelete() {
        DispatchQueue.main.async {
            self.notes = []
            self.notesCollectionView.reloadData()
        }
    }
    
    func failureDelete() {
        let alert = UIAlertController(title: "Ошибка", message: "Не удалось удалить заметку!", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "ОК", style: .cancel)
        alert.addAction(acceptAction)
        present(alert, animated: true)
    }
    
}



extension NoteViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCell.reuseId, for: indexPath) as? NoteCell else {
            return UICollectionViewCell()
        }
        
        let note = notes[indexPath.row].title ?? ""
        
        let colors: [UIColor] = [
            UIColor().rgb(r: 217, g: 187, b: 249, alpha: 1),
            UIColor().rgb(r: 215, g: 247, b: 242, alpha: 1),
            UIColor().rgb(r: 215, g: 237, b: 248, alpha: 1),
            UIColor().rgb(r: 255, g: 245, b: 225, alpha: 1)
        ]
        let color = colors[indexPath.row % colors.count]
        cell.setup(title: note, color: color)
        return cell
    }
}

extension NoteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 12) / 2 , height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let noteView = NewNotesView()
        noteView.note = notes[indexPath.row]
        navigationController?.pushViewController(noteView, animated: true)
    }
}

extension NoteViewController: NoteViewProtocol {
    func succesNotes(notes: [Note]) {
        self.notes = notes
        notesCollectionView.reloadData()
    }
}
