import SwiftUI

struct NoitemsView: View {
    
  @State var animate: Bool = false
    
    let SecondaryAccentcolor = Color("SecondaryAccentcolor")
    var body: some View {
        ScrollView {
            VStack{
                Text("There are no items!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                Text("are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                NavigationLink(
                    destination: Addview(),
                    label: {
                        Text("Add Something😚🤔")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? SecondaryAccentcolor : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal,animate ? 30 : 50)
                .shadow(
                    color: animate ?SecondaryAccentcolor.opacity(0.7) :
                        Color.accentColor.opacity(0.7),
                    radius: animate ? 50 : 10,
                    x:0.0,
                    y:0.0)
                
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40 )
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0 )
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}
    #Preview {
        NavigationView {
            NoitemsView()
                .navigationTitle("title")
        }
        
    }

