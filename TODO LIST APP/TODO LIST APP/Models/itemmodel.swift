import Foundation

struct itemmodel: Identifiable,Codable {
    let id: String
    let title: String
    let iscompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, iscompleted: Bool) {
        self.id = id
        self.title = title
        self.iscompleted = iscompleted
    
    }
    
    
    func updatecompletion() -> itemmodel {
        return itemmodel(id: id, title: title, iscompleted: !iscompleted)
    }
}
