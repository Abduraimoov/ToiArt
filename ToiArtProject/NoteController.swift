//
//  HomeController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

protocol NoteControllerProtocol {
    
    func onGetNotes()
    
    func onSuccesNotes(notes: [Note])
    
    func onNoteSearching(text: String)
    
    func onSearchResult(notes: [Note])
}

class NoteController: NoteControllerProtocol {
    
    private var view: NoteViewProtocol?
    private var model: NoteModelProtocol?
    
    init(view: NoteViewProtocol) {
        self.view = view
        self.model = NoteModel(controller: self)
    }
    
    func onGetNotes() {
        model?.getNotes()
    }
    
    func onSuccesNotes(notes: [Note]) {
        view?.succesNotes(notes: notes)
        
    }
    
    func onNoteSearching(text: String) {
        model?.searchNotes(text: text)
    }
    
    func onSearchResult(notes: [Note]) {
        view?.succesNotes(notes: notes)
    }
    
}
