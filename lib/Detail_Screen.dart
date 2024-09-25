import 'package:flutter/material.dart';
import 'dart:math';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String pokemonName = '';
  List<String> pokemonAbilities = [];
  String pokemonImageUrl = '';
  bool isPokemonSelected = false;

  // Lista de Pokémon
  final List<Map<String, dynamic>> pokemonList = [
    {
      'name': 'Pikachu',
      'abilities': ['Impactrueno', 'Rayo'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png'
    },
    {
      'name': 'Charizard',
      'abilities': ['Lanzallamas', 'Vuelo'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png'
    },
    {
      'name': 'Bulbasaur',
      'abilities': ['Latigazo', 'Bomba lodo'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png'
    },
    {
      'name': 'Squirtle',
      'abilities': ['Pistola agua', 'Hidro bomba'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png'
    },
    {
      'name': 'Jigglypuff',
      'abilities': ['Canto', 'Golpe cuerpo'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/039.png'
    },
    {
      'name': 'Meowth',
      'abilities': ['Rasguño', 'Día de pago'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/052.png'
    },
    {
      'name': 'Gengar',
      'abilities': ['Bola sombra', 'Lengüetazo'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/094.png'
    },
    {
      'name': 'Eevee',
      'abilities': ['Ataque rápido', 'Mordisco'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/133.png'
    },
    {
      'name': 'Snorlax',
      'abilities': ['Descanso', 'Golpe cuerpo'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/143.png'
    },
    {
      'name': 'Lucario',
      'abilities': ['Esfera aural', 'Puño incremento'],
      'imageUrl':
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/448.png'
    },
  ];

  void selectRandomPokemon() {
    final random = Random();
    final pokemon = pokemonList[random.nextInt(pokemonList.length)];
    setState(() {
      pokemonName = pokemon['name'];
      pokemonAbilities = List<String>.from(pokemon['abilities']);
      pokemonImageUrl = pokemon['imageUrl'];
      isPokemonSelected = true;
    });
  }

  void resetSelection() {
    setState(() {
      isPokemonSelected = false;
      pokemonName = '';
      pokemonAbilities = [];
      pokemonImageUrl = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PÓKEMONES')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D0D0D), Color(0xFF1C1C1C), Color(0xFF3A3A3A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿Preparados para la batalla?',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (isPokemonSelected) ...[
                Image.network(pokemonImageUrl, height: 150),
                Text('¡Has seleccionado a $pokemonName!',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text('Habilidades:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                ...pokemonAbilities.map((ability) => ListTile(
                      leading: const Icon(Icons.flash_on, color: Colors.yellow),
                      title: Text(ability,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white)),
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: resetSelection,
                  child: const Text('Volver Al Menú'),
                ),
              ] else ...[
                const Text(
                    'Presiona el botón para seleccionar un Pokémon al azar',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
              ElevatedButton(
                onPressed: selectRandomPokemon,
                child: const Text('Elegir Pokemon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
