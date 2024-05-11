//
//  HomeModel.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

protocol NoteModelProtocol {
    
    func getNotes()
    
    func searchNotes(text: String)
}

class NoteModel: NoteModelProtocol {
    
    private let controller: NoteControllerProtocol?
    
    private let coreDataService = CoreDataService.shared
    
    init(controller: NoteControllerProtocol) {
        self.controller = controller
    }
    
    private var notes: [Note] = []
    
    private var filteredNotes: [Note] = []
    
    func getNotes() {
        notes = coreDataService.fetchNotes()
        controller?.onSuccesNotes(notes: notes)
    }
    
    func searchNotes(text: String) {
        filteredNotes = []
        if text.isEmpty {
            filteredNotes = notes
            controller?.onSuccesNotes(notes: notes)
        } else {
            filteredNotes = notes.filter({ note in
                note.title!.uppercased().contains(text.uppercased())
            })
            controller?.onSuccesNotes(notes: filteredNotes)
        }
    }
    
}
