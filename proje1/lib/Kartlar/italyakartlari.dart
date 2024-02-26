import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'GeceHayati/italyagecehayati.dart';
import 'GezilecekYerler/italyagezilecekyerler.dart';
import 'Ulasim/italyaulasim.dart';
import 'Yemekler/italyayemek.dart';

class Kartlar extends StatefulWidget {
  @override
  _KartlarState createState() => _KartlarState();
}

class _KartlarState extends State<Kartlar> {
  int hoveredIndex = -1;
  final List<String> titles = ['Yemekler', 'Gezilecek Yerler', 'Gece Hayatı', 'Ulaşım'];
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/2233348/pexels-photo-2233348.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1701595/pexels-photo-1701595.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/3249760/pexels-photo-3249760.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/302428/pexels-photo-302428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              titles.length,
              (index) => buildCard(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    final bool isHovering = hoveredIndex == index;
    final imageSize = isHovering ? Size(160, 150) : Size(150, 150); // Resim boyutu

    return GestureDetector(
      onTap: () {
         switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItalyaYemek()), // FinlandiyaYemek sayfasına yönlendirme
        );
        break;
      
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItalyaGezilecekYerler()), 
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItalyaGeceHayati()), 
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItalyaUlasim()), 
        );
        break;
      default:
        break;
    }
    
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            hoveredIndex = index;
          });
        },
        onExit: (_) {
          setState(() {
            hoveredIndex = -1;
          });
        },
        child: Container(
          width: imageSize.width, 
          height: imageSize.height, 
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), 
              child: Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: isHovering
                      ? Image.network(
                          imageUrls[index], 
                          height: imageSize.height,
                          width: double.infinity, 
                          fit: BoxFit.cover, 
                          key: ValueKey<String>('image_$index'),
                        )
                      : Text(
                          titles[index],
                          style: GoogleFonts.azeretMono(
                            fontSize: 16,
                            shadows: [Shadow(blurRadius: 5, color: Colors.grey)],
                          ).copyWith(color: Colors.orange),
                          key: ValueKey<String>('text_$index'),
                        ),
                ),
              ),
            ),
          ),
        ),),);}
}