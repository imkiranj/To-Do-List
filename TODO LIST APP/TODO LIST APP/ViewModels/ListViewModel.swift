import Foundation
class ListViewModel:ObservableObject {
    
    @Published var items : [itemmodel] = [] {
        didSet {
            saveItem()
        }
    }
    let itemskey:String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
           guard
            let data = UserDefaults.standard.data(forKey: itemskey),
           let savedItem = try? JSONDecoder().decode([itemmodel].self, from: data)
        else { return }
        
        self.items = savedItem
    }
    
    func deleteItem(indexSet:IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String) {
        let newItem = itemmodel(title: title, iscompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: itemmodel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updatecompletion()
        }
    }
    
    func saveItem() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodeData , forKey:itemskey)
        }
    }
    
}
