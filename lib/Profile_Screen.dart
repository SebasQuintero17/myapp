import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.xbox),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.greenAccent),
        title: const Text('Mi Perfil ', style: TextStyle(color: Colors.greenAccent)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D0D0D),
              Color(0xFF1C1C1C),
              Color(0xFF3A3A3A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Foto de Usuario
            const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/v2/D4E03AQFhqz3p-YlNKQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1724103398109?e=1732752000&v=beta&t=HSDSVGvMN9q-5Pzs89iVKRPXdGCIIqmYJIUCWf1DS4Y'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sebastian ',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Sección de Trofeos
            const Text(
              'Trofeos de Pikachu',
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Trofeos
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(20),
                children: [
                  _buildTrophy(FontAwesomeIcons.trophy, 'Primer Pikachu'),
                  _buildTrophy(FontAwesomeIcons.award, 'Experto Pikachu'),
                  _buildTrophy(FontAwesomeIcons.medal, 'Maestro Charmander'),
                  _buildTrophy(FontAwesomeIcons.star, 'Leyenda Charizard'),
                  _buildTrophy(FontAwesomeIcons.crown, 'Rey de Caterpie'),
                  _buildTrophy(FontAwesomeIcons.gamepad, 'Leyenda Pikachu!'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir los trofeos
  Widget _buildTrophy(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          color: Colors.amberAccent,
          size: 45,
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
