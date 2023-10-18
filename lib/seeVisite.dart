import 'dart:html';
import 'class/Visite.dart';
import 'class/Passerelle.dart';
import 'package:flutter/material.dart';

class SeeVisite extends StatefulWidget {
  const SeeVisite({Key? key}) : super(key: key);

  @override
  State<SeeVisite> createState() => _SeeVisiteState();
}

class _SeeVisiteState extends State<SeeVisite> {
  List<Visite> visites = [];
  Visite visit = Visite.sansArg();

  @override
  void initState() {
    super.initState();
    loadVisites();
  }

  Future<void> loadVisites() async {
    List<Visite> listFuture = await Passerelle.getLesVisites();
    
    //visit = await Passerelle.getLaVisiteByID(1);
    setState(() {
      visites = listFuture.expand((v) => [v]).toList();

      //visites.add(visit);
    });
  }

// final visites = [
//   {
//     "medecin": "test",
//     "adresse": "9 rue racin, 62670 Mazingarbe",
//     "date": "20/01/2023"
//   },
//   {
//     "medecin": "aaaaa",
//     "adresse": "12 boulevard rachid, 62300 Lens",
//     "date": "01/03/2023"
//   },
//   {
//     "medecin": "paul",
//     "adresse": "62 rue degaulle, 59000 Lille",
//     "date": "25/10/2023"
//   }
// ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Voir les Visites"))),
        body: Center(
            child: ListView.builder(
          itemCount: visites.length,
          itemBuilder: (context, index) {
            final visite = visites[index];
            final medecin = visite.getMedecin()!.getNom();
            final adresse = visite.getAdresse();
            final date = visite.getDateVisite();
            //final prod = visite.getProduit()?.getLibelle();

            return Card(
              child: ListTile(
                title: Text("$medecin"),
                subtitle: Text("$date - $adresse"),
              ),
            );
          },
        )));
  }
}
