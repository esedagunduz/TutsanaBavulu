import 'package:flutter/material.dart';
import 'GezilecekYerler/amerikagezilecekyerler.dart';
import 'Ulasim/amerikaulasim.dart';
import 'GeceHayati/amerikagecehayati.dart';
import 'Yemekler/amerikayemekler.dart';
import 'package:google_fonts/google_fonts.dart';

class AmerikaKartlari extends StatefulWidget {
  @override
  _AmerikaKartlariState createState() => _AmerikaKartlariState();
}

class _AmerikaKartlariState extends State<AmerikaKartlari> {
  int hoveredIndex = -1;
  final List<String> titles = [
    'Yemekler',
    'Gezilecek Yerler',
    'Gece Hayatı',
    'Ulaşım'
  ];
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/12101105/pexels-photo-12101105.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3052361/pexels-photo-3052361.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/3109671/pexels-photo-3109671.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2422588/pexels-photo-2422588.jpeg?auto=compress&cs=tinysrgb&w=600',
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
    final imageSize =
        isHovering ? Size(160, 150) : Size(150, 150); 

    return GestureDetector(
      onTap: () {
        // Kart sayfasına yönlendirme işlemi
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AmerikaYemek()), 
            );
            break;
      
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AmerikaGezilecekYerler()), 
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AmerikaGeceHayati()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AmerikaUlasim()), 
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
              borderRadius: BorderRadius.circular(15.0), // Köşeleri yuvarlatma
              child: Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: isHovering
                      ? Image.network(
                          imageUrls[index], // Farklı resim URL'si
                          height: imageSize.height,
                          width:
                              double.infinity, // Kartın genişliğine göre ayarla
                          fit: BoxFit
                              .cover, // Resmi kartın boyutuna sığacak şekilde ayarla
                          key: ValueKey<String>('image_$index'),
                        )
                      : Text(
                          titles[index],
                          style: GoogleFonts.azeretMono(
                            fontSize: 16,
                            shadows: [
                              Shadow(blurRadius: 5, color: Colors.grey)
                            ],
                          ).copyWith(color: Colors.orange),
                          key: ValueKey<String>('text_$index'),
                        ),
                ),
              ),
            ),
          ),
        ),),);}
}