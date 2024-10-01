import SwiftUI
@main
struct TODO_LIST_APPApp: App {
   @StateObject var  listViewModel:  ListViewModel =  ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
