import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var cityViewModel: CityViewModel
    @State private var showPicker = false

    var body: some View {
        VStack(spacing: 0) {
            Color.yellow
                .ignoresSafeArea()
                .frame(height: 10)
                .padding(0)
            Image(.login)
                .resizable()
                .scaledToFit()
            Text("Hola, bienvenido a Mandao")
                .padding(20)
                .font(.title2)
                .fontWeight(.bold)
                .kerning(-1)
            Text("Dónde quieres ver nuestras ofertas")
                .font(.callout)
                .padding()
                .kerning(-1)
            VStack {
                HStack {
                    Text(appState.selectedProvince.name)
                        .foregroundColor(.black)
                        .kerning(-0.5)
                        .padding()
                        .fontWeight(.bold)
                        .font(.callout)
                        .onTapGesture {
                            showPicker.toggle()
                        }

                    Spacer()

                    Image(systemName: "chevron.down")
                        .padding()
                        .onTapGesture {
                            showPicker.toggle()
                        }
                }
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 0.8)
                )
                .padding(.horizontal, 30)

                Spacer()
            }

            .sheet(isPresented: $showPicker) {
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(cityViewModel.cities) { city in
                                Button(action: {
                                    print("Changing province to: \(city.name)")
                                    appState.selectedProvince = city
                                    showPicker.toggle()
                                }) {
                                    Text(city.name)
                                        .font(.system(size: 18, weight: .medium))
                                        .foregroundColor(.black)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(city.name == appState.selectedProvince.name ? Color.yellow.opacity(0.1) : Color.clear))
                                }
                            }
                        }
                        .padding()
                    }
                }
                .padding()
                .presentationDetents([.medium, .large])
            }
            Button("Confirmar") {
                appState.isLoggedIn = true
            }
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding()
            .kerning(-1)
            .background(Color.yellow)
            .cornerRadius(50)
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AppState())
            .environmentObject(CityViewModel())
    }
}
