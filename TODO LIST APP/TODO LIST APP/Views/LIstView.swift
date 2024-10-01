import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var  listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoitemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        Listrowview(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("TODO List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add", destination:Addview())
                            
        )
       
    }
    
}
