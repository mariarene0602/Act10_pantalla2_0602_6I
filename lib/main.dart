import 'package:flutter/material.dart';

void main() => runApp(const CanisApp());

class CanisApp extends StatelessWidget {
  const CanisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF8F9FA)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Paleta de colores Elegante
  final Color navyBlue = const Color(0xFF001F3F); // Azul Marino
  final Color gold = const Color(0xFFD4AF37);     // Dorado Academia

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navyBlue,
        elevation: 10,
        shadowColor: gold.withOpacity(0.3),
        // Icono hamburguesa automático por el drawer
        iconTheme: IconThemeData(color: gold), 
        title: Text(
          "CANIS ACADEMIA",
          style: TextStyle(
            color: gold,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: gold),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: navyBlue,
          child: Center(child: Text("Menú", style: TextStyle(color: gold))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,          // 2 columnas
          crossAxisSpacing: 20,       // Espacio lateral
          mainAxisSpacing: 20,        // Espacio vertical
          childAspectRatio: 0.7,      // <--- CLAVE: Menor a 1.0 los hace más ALTOS que anchos
          children: [
            _buildTallCard("Cursos", Icons.menu_book_rounded),
            _buildTallCard("Nosotros", Icons.groups_rounded),
            _buildTallCard("Testimonios", Icons.star_rounded),
            _buildTallCard("Comprar curso", Icons.payments_rounded),
          ],
        ),
      ),
    );
  }

  Widget _buildTallCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: navyBlue, // Fondo azul marino para el widget
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: gold, width: 2), // Borde dorado
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Círculo decorativo para el icono
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: gold.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 45, color: gold),
          ),
          const SizedBox(height: 20),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          // Una línea decorativa pequeña
          Container(
            width: 40,
            height: 2,
            color: gold,
          )
        ],
      ),
    );
  }
}