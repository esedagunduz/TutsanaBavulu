import 'package:flutter/material.dart';
import 'spinwheelscreen.dart';
import 'main2.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(TurkiyeApp());
}

class TurkiyeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TurkiyePage(),
    );
  }
}

class TurkiyePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();


  Widget _buildTravelPlace(String title, String description, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            style: TextStyle(fontSize: 18),
          ),
          Image.network(
            imageUrl,
            height: 300,
            width: 500,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            content,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, 
        backgroundColor: Color.fromARGB(255, 23, 34, 237),// gölge efektini kaldırıyor
        title: Center(
          child: Text('ÜZGÜNÜZ',
          style: GoogleFonts.azeretMono(
                              
                              fontSize: 35,
                              
                              shadows: [Shadow(blurRadius: 5,color: Colors.grey,),],
                              ).copyWith(color:const Color.fromARGB(255, 255, 255, 255)),),
        ),
        

      ),
      
            body: Container(
              height: 1000,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 23, 34, 237), Color.fromARGB(255, 255, 119, 0)],
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
  child: Container(
    
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 104, 103, 103).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.network(
        'https://cdn1.img.sputniknews.com.tr/img/07e7/0a/1b/1076782308_575:0:1935:1360_1280x0_80_0_0_6cae60b1e096709ce1367a4a014dcdba.jpg',
        
        height: 400,
        width: 500,
        fit: BoxFit.cover,
      ),
    ),
  ),
),


SizedBox(height: 30,),
 Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'ÜZGÜNÜZ DOSTUM. SEN BU TATİL EVDE KALMALISIN.',
                    style: GoogleFonts.azeretMono(
                                
                                fontSize: 16,
                                
                                shadows: [Shadow(blurRadius: 5,color: Colors.grey,),],
                                ).copyWith(color:const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),



SizedBox(height: 30,),
Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  
                  child: Center(
                    child: SizedBox(width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),),),
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>HolidayPollApp()));
                        },
                        child: Center(
                          child: Text('Teste Geri Dön ',
                          style: GoogleFonts.azeretMono(
                                    
                                    fontSize: 16,
                                    
                                    shadows: [Shadow(blurRadius: 5,color: Colors.grey,),],
                                    ).copyWith(color:const Color.fromARGB(255, 255, 255, 255)),),
                        ),
                      ),
                    ),
                  ),
                  
                ),
                
              ),
              Align(
  alignment: Alignment.centerLeft,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: SizedBox(
        width: 400,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CarkApp())); // 'AnotherPage()' yerine gitmek istediğiniz sayfa widget'ını ekleyin
          },
          child: Center(
            child: Text(
              'Çarka Geri Dön',
              style: GoogleFonts.azeretMono(
                fontSize: 16,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.grey,
                  ),
                ],
              ).copyWith(
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ),),),
),
            ],
          ),
        ),),);}}
