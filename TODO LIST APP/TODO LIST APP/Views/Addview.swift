import SwiftUI

struct Addview: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText:String = ""
    
    @State var alertTitle:String = ""
    @State var ShowAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack{
                TextField("Type Something here...", text: $textFieldText)          
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed,
                       label: {
                    Text("Save" .uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
             }
            .padding(10)
        }
        .navigationTitle("Add an Item🖊️")
        .alert(isPresented: $ShowAlert, content: getalert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title:textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
       
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your Todo List item must have atleast 3 Characters🥲😨"
            ShowAlert.toggle()
            return false
        }
        return true
    }
    
    func getalert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        Addview()
    }
    .environmentObject(ListViewModel())
}

