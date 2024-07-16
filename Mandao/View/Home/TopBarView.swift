import SwiftUI

struct TopBarView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var cityViewModel: CityViewModel
    @State private var showPicker = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(maxWidth: .infinity)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)

            HStack {
                VStack {
                    Text("Entregar a")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .padding(.horizontal, 10)
                        .padding(.top, 0)
                    HStack {
                        Text(appState.selectedProvince.name)
                            .foregroundColor(.black)
                            .kerning(-0.5)
                            .fontWeight(.bold)
                            .font(.callout)
                            .onTapGesture {
                                showPicker.toggle()
                            }
                        Image(systemName: "chevron.down")
                            .fontWeight(.semibold)
                            .font(.caption)
                            .onTapGesture {
                                showPicker.toggle()
                            }
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 0)
                    .sheet(isPresented: $showPicker) {
                        VStack(spacing: 0) {
                            ScrollView {
                                VStack(spacing: 10) {
                                    ForEach(cityViewModel.cities) { city in
                                        Button(action: {
                                            appState.selectedProvince = city
                                            showPicker.toggle()
                                        }) {
                                            Text(city.name)
                                                .font(.system(size: 18, weight: .medium))
                                                .foregroundColor(city.name == appState.selectedProvince.name ? .blue : .black)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(city.name == appState.selectedProvince.name ? Color.blue.opacity(0.1) : Color.clear))
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                        .padding()
                        .presentationDetents([.medium, .large])
                    }
                }
                Button("Iniciar/Registrarse") {
                    // Acción para iniciar sesión o registrarse
                }
                .padding(.horizontal, 5)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(9)
                .kerning(-0.5)
                .background(Color.yellow)
                .cornerRadius(50)
                .padding(.horizontal, 10)
                .padding(.vertical, 0)
            }
            .background(Color.white)
            .cornerRadius(10)
        }
        .frame(height: 70)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
            .environmentObject(AppState())
            .environmentObject(CityViewModel())
    }
}
