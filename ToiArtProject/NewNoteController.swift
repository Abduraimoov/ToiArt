//
//  NewNoteController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import Foundation

protocol NewNoteControllerProtocol {
    
    func onAddNote(note: Note?, title: String, description: String)
    
    func onSuccesAddNote()
    
    func onFailureAddNote()
    
    func onDeleteNote(id: String)
    
    func onSuccesDelete()
    
    func onFailureDelete()
    
    func onSuccessUpdateNote(note: Note?, id: String, title: String, description: String, date: String)
    
}

class NewNoteController: NewNoteControllerProtocol {
 
    var view: NewNoteViewProtocol?
    var model: NewNoteModelProtocol?
    
    init(view: NewNoteViewProtocol) {
        self.view = view
        self.model = NewNoteModel(controller: self)
    }
   
    func onAddNote(note: Note?, title: String, description: String) {
        model?.AddNote(note: note, title: title, description: description)
    }
    
    func onSuccesAddNote() {
        view?.successAddNote()
    }
    
    func onFailureAddNote() {
        view?.failureAddNote()
    }

    func onDeleteNote(id: String) {
        model?.deleteNote(id: id)
    }
    
    func onSuccesDelete() {
        view?.succesDelete()
    }
    
    func onFailureDelete() {
        view?.failureDelete()
    }
    
    func onSuccessUpdateNote(note: Note?, id: String, title: String, description: String, date: String) {
           view?.successUpdateNote()
       }
    
}

