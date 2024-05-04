//
//  HerosListView.swift
//  SuperPoderesRocio
//
//  Created by Rocio Martos on 26/4/24.
//

import SwiftUI

struct HerosListView: View {
    var hero: SuperHero // Eliminamos el signo de exclamación
    @StateObject var viewModel: HeroViewModel
    @StateObject var serie: SeriesViewModel
    @State private var filter: String = ""
    @State private var searchText: String = ""
    
    init(hero: SuperHero, viewModel: HeroViewModel, serie: SeriesViewModel) {
        self.hero = hero // Inicializamos la variable `hero` en el inicializador
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._serie = StateObject(wrappedValue: serie)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Barra de búsqueda personalizada
                TextField("Buscar", text: $searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Lista de héroes
                List {
                    NavigationLink(
                        destination: HeroDetailView(hero: hero),
                        label: {
                            HerosRowView(hero: hero)
                        }
                    )
                }
                .navigationTitle("SuperHeroes")
            }
        }
        .accentColor(.orange) // Color de acento para los enlaces de navegación
    }
}
#Preview {
    HerosListView(hero:SuperHero(id: 0001, name: "Periquito", description: "En la naturaleza, son las aves con más población de toda Australia lo que podría deberse a su rápida reproducción ya que dejan de ser pichones y empiezan su reproducción a partir de los sesenta días de haber nacido, y a que las hembras ponen, en promedio, de cinco a seis huevos, lo cual las hace ser muy adaptables, aunque ellas habitan en Australia extendiéndose por el centro del país.", modified: "", thumbnail: SuperHeroThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: ".jpg"), resourceURI: "", comics: SuperHeroComics(available: 1, collectionURI: "", items: [], returned: 12), series: SuperHeroComics(available: 12, collectionURI: "", items: [], returned: 12), stories: SuperHeroComics(available: 12, collectionURI: "", items: [], returned: 12), events: SuperHeroComics(available: 12, collectionURI: "", items: [], returned: 2), urls: []) , viewModel: HeroViewModel(), serie: SeriesViewModel())
}
