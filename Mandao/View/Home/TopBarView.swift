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
                            Text("Dónde quieres ver nuestras ofertas")
                                .font(.headline)
                                .padding(.top)
                                .padding(.leading)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView {
                                VStack(spacing: 0) {
                                    ForEach(cityViewModel.cities) { city in
                                        VStack{
                                            Divider()
                                            Button(action: {
                                                print("Changing province to: \(city.name)")
                                                appState.selectedProvince = city
                                                showPicker.toggle()
                                            }) {
                                                HStack {
                                                    Text(city.name)
                                                        .font(.system(size: 14, weight: .medium))
                                                        .foregroundColor(.black)
                                                    Spacer()
                                                    if city.id == appState.selectedProvince.id {
                                                        Image(systemName: "checkmark")
                                                            .foregroundColor(.green)
                                                            .fontWeight(.black)
                                                    }
                                                }
                                                .padding(.vertical)
                                            }
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
                    //Do something
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

#Preview{
    TopBarView()
        .environmentObject(AppState())
        .environmentObject(CityViewModel())
}

