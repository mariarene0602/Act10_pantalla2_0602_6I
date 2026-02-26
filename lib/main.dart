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
      // 1. BARRA SUPERIOR
      appBar: AppBar(
        backgroundColor: navyBlue,
        elevation: 10,
        shadowColor: gold.withOpacity(0.3),
        centerTitle: true,
        // Color de los íconos de la AppBar (Hamburguesa y Ajustes)
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
        // 2. ÍCONO DE AJUSTES (Derecha)
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Acción para abrir ajustes
            },
          ),
        ],
      ),

      // 3. MENÚ HAMBURGUESA (Izquierda)
      // Al agregar 'drawer', Flutter pone automáticamente el ícono de hamburguesa a la izquierda
      drawer: Drawer(
        child: Container(
          color: navyBlue,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: navyBlue),
                child: Center(
                  child: Text(
                    "CANIS ACADEMIA", 
                    style: TextStyle(color: gold, fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: gold),
                title: const Text("Inicio", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),

      // 4. CUERPO CON WIDGETS LARGOS
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.7, // Mantiene el formato largo (vertical)
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: navyBlue, width: 2.5), 
        boxShadow: [
          BoxShadow(
            color: navyBlue.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: navyBlue, 
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 45, color: gold),
          ),
          const SizedBox(height: 20),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: navyBlue, 
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 3,
            decoration: BoxDecoration(
              color: gold,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}