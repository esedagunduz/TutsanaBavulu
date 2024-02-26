import 'package:flutter/material.dart';


import 'Yemekler/japonyayemekler.dart';
import 'GeceHayati/japonyagecehayati.dart';
import 'Ulasim/japonyaulasim.dart';
import 'GezilecekYerler/japonyagezilecekyerler.dart';
import 'package:google_fonts/google_fonts.dart';

class JaponyaKartlari extends StatefulWidget {
  @override
  _JaponyaKartlariState createState() => _JaponyaKartlariState();
}

class _JaponyaKartlariState extends State<JaponyaKartlari> {
  int hoveredIndex = -1;
  final List<String> titles = ['Yemekler', 'Gezilecek Yerler', 'Gece Hayatı', 'Ulaşım'];
  final List<String> imageUrls = [
     'https://i.hizliresim.com/rsxrur3.jpg',
    'https://i.hizliresim.com/34yc4hw.jpg',
    'https://i.hizliresim.com/b9kr7zy.jpg',
    'https://i.hizliresim.com/khaksgx.jpg',
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
    final imageSize = isHovering ? Size(160, 150) : Size(150, 150); 

    return GestureDetector(
      onTap: () {

  
        switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JaponyaYemek()), 
        );
        break;
     
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JaponyaGezilecekYerler()), 
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JaponyaGeceHayati()), 
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JaponyaUlasim()), 
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