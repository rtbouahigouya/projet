import 'package:flutter/material.dart';
import 'package:projet/WIDGETS/background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Journal extends StatefulWidget {
  final String titre;
  Journal({this.titre});
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('JOURNALS');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titre.toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: BackgroundWidget(),
          child: StreamBuilder(
            stream: firestore.orderBy('DATE').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('chargement en cours');
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return liste(
                      context, snapshot.data.documents[index]); // ListTile(
                  //title: Text(snapshot.data.documents[index]['TITRE']),
                  // );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget liste(BuildContext context, DocumentSnapshot doc) {
    return Card(
      elevation: 0,
      color: Colors.white.withOpacity(.5),
      margin: EdgeInsets.symmetric(
          vertical: 5, horizontal: MediaQuery.of(context).size.width * .15),
      child: Column(
        children: [
          Text('${doc['TITRE']} du ${doc['DATE']} ${doc['EDITION']}'),
          Text('Presente par ${doc['PRESENTATEUR']}')
        ],
      ),
    );
  }
}
