import 'package:flutter/material.dart';
import 'package:projet/COULEUR/couleur.dart';
import 'package:projet/WIDGETS/background.dart';

import 'SCREENS/journal.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: CustomPaint(
          painter: BackgroundWidget(),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width * .35,
                child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('images/logo.jpeg')),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .3,
                left: MediaQuery.of(context).size.width * .16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        menu(context, 'journal radio'),
                        menu(context, 'emission radio'),
                      ],
                    ),
                    Row(
                      children: [
                        menu(context, 'dossier radio'),
                        menu(context, 'autre'),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: MediaQuery.of(context).size.width * .16,
                  bottom: MediaQuery.of(context).size.height * .05,
                  child: lienRTB(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu(BuildContext context, String titre) {
    return GestureDetector(
      onTap: () {
        print(titre);
        switch (titre) {
          case 'journal radio':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Journal(titre: titre)));
            break;
          default:
        }
      },
      child: Card(
        elevation: 3,
        color: jaune,
        child: Container(
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width * .32,
          child: Center(
              child: Text(
            titre.toUpperCase(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  Widget lienRTB(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('lien vers le site rtb');
      },
      child: Container(
        child: Center(
            child: Text(
          'http://www.rtb.bf',
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        )),
        height: 25,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: jaune),
      ),
    );
  }
}
