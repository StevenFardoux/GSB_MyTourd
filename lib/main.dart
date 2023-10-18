import 'package:flutter/material.dart';
import 'addVisite.dart';
import 'seeVisite.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("GSB")
          ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../assets/laboratoire.jpg"),
            fit: BoxFit.cover
            ),
        ),
        child:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
            const Text(
            "Bienvenue",
            style: TextStyle(fontSize: 50,),
          ),
          const Text("Choisissez où voulez vous aller",
          style: TextStyle(fontSize: 20,),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
             onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => AddVisite()
                  )
              );
            },
            child: const Text("Ajouter une Visite ",
            style: TextStyle(fontSize: 20),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
             onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => SeeVisite()
                  )
              );
            },
            child: const Text("Voir les visites",
            style: TextStyle(fontSize: 20),
            ),
            ),
        ],
        )
        ),
      ),
    );
  }
}

