import 'package:flutter/material.dart';
import 'GezilecekYerler/hindistangezilecekyerler.dart';
import 'Yemekler/hindistanyemek.dart';
import 'GeceHayati/hindistangecehayati.dart';
import 'Ulasim/hindistanulasim.dart';
import 'package:google_fonts/google_fonts.dart';

class HindistanKartlari extends StatefulWidget {
  @override
  _HindistanKartlariState createState() => _HindistanKartlariState();
}

class _HindistanKartlariState extends State<HindistanKartlari> {
  int hoveredIndex = -1;
  final List<String> titles = ['Yemekler', 'Gezilecek Yerler', 'Gece Hayatı', 'Ulaşım'];
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/618491/pexels-photo-618491.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1007427/pexels-photo-1007427.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/9194750/pexels-photo-9194750.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/17899648/pexels-photo-17899648/free-photo-of-sokak-hindistan-kentsel-tekerlek.jpeg?auto=compress&cs=tinysrgb&w=600',
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
          MaterialPageRoute(builder: (context) => HindistanYemek()), 
        );
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HindistanGezilecekYerler()), 
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HindistanGeceHayati()), 
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HindistanUlasim()), 
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
        ),
      ),
    );
  }
}