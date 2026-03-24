import 'package:flutter/material.dart';

void main() {
  runApp(const DairyQueenApp());
}

class DairyQueenApp extends StatelessWidget {
  const DairyQueenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dairy Queen Menu',
      theme: ThemeData(
        primaryColor: const Color(0xFFEF3E42), // Rojo estilo Dairy Queen
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEF3E42),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MenuGridScreen(),
    );
  }
}

class MenuGridScreen extends StatelessWidget {
  const MenuGridScreen({super.key});

  // Lista de los 14 productos con tus imágenes de GitHub
  static final List<Map<String, dynamic>> dqProducts = [
    {
      'title': 'Blizzard Avellana',
      'subtitle': 'Delicia de avellana',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/Avellana.JPG',
      'rating': 5,
    },
    {
      'title': 'Pastel de Chocolate',
      'subtitle': 'Relleno cremoso',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/pastelchoco.png',
      'rating': 4,
    },
    {
      'title': 'Dilly Bar',
      'subtitle': 'Paleta clásica DQ',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/dqpaleta.png',
      'rating': 5,
    },
    {
      'title': 'Combo Para Llevar',
      'subtitle': 'Disfruta en casa',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/para%20llevar%201.PNG',
      'rating': 4,
    },
    {
      'title': 'Blizzard Caramelo',
      'subtitle': 'Toque dulce',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/caramelo.JPG',
      'rating': 5,
    },
    {
      'title': 'Pastel Helado 3',
      'subtitle': 'Para compartir',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/pastel3.PNG',
      'rating': 5,
    },
    {
      'title': 'DQ Sandwich',
      'subtitle': 'Helado entre galletas',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/dqsanduish.png',
      'rating': 4,
    },
    {
      'title': 'Blizzard Oreo',
      'subtitle': 'El favorito de todos',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/oreoicecream.png',
      'rating': 5,
    },
    {
      'title': 'Cono Clásico',
      'subtitle': 'El tradicional DQ',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/cono.PNG',
      'rating': 4,
    },
    {
      'title': 'Fresa Pay de Queso',
      'subtitle': 'Sabor irresistible',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/fresapayqueso.png',
      'rating': 5,
    },
    {
      'title': 'Helado Especial',
      'subtitle': 'Edición limitada',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/image.png',
      'rating': 4,
    },
    {
      'title': 'Para Llevar 2',
      'subtitle': 'Doble diversión',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/parallevar%202.PNG',
      'rating': 4,
    },
    {
      'title': 'Blizzard KitKat',
      'subtitle': 'Crujiente y cremoso',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/kitkat.PNG',
      'rating': 5,
    },
    {
      'title': 'Pastel Helado 1',
      'subtitle': 'Celebra con DQ',
      'image': 'https://raw.githubusercontent.com/OmarMartinez0637/Imagenes-Para-DairyQueen/refs/heads/main/pastel1.PNG',
      'rating': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Dairy Queen', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: dqProducts.length, // 14 elementos
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columnas
            childAspectRatio: 0.65, // Ajusta la proporción para dar espacio al texto
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = dqProducts[index];
            return ProductCard(
              title: product['title'],
              subtitle: product['subtitle'],
              imageUrl: product['image'],
              rating: product['rating'],
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final int rating;

  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Imagen en la parte superior
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            ),
          ),
          // Parte inferior (3 filas: Título, Subtítulo, Estrellas)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fila 1: Título
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // Fila 2: Subtítulo
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Fila 3: Estrellitas
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}