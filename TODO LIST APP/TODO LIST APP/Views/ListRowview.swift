import SwiftUI

struct Listrowview: View {
    
    let item: itemmodel
    
    var body: some View {
        HStack{
            Image(systemName: item.iscompleted ? "checkmark.circle" :"circle")
                .foregroundColor(item.iscompleted ? .green : .red)
               
            Text(item.title)
            Spacer()
        }

    }
}
    
    




