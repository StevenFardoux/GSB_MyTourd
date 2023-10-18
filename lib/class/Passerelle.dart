import 'dart:convert';
import 'dart:async';
import 'package:mytour/class/Produit.dart';

import 'Medecin.dart';
import 'Visite.dart';
import 'Visiteur.dart';
import 'package:http/http.dart' as http;

class Passerelle {
  static Future<Medecin> getLeMedecinsById(int id) async {
    final resp = await http
        .get(Uri.http('127.0.0.2', '/API/medecin.php', {"id": id.toString()}));

    if (resp.statusCode == 200) {
      var res = jsonDecode(resp.body);
      var data = res;
      print(res);
      return Medecin(
          int.parse(data['idmedecin']),
          data['nom'],
          data['prenom'],
          data['mail'],
          data['motDePasse'],
          (data['dateCreation'] != null)
              ? DateTime.parse(data['dateCreation'])
              : DateTime.now(),
          data['rpps'] ?? "",
          (data['dateDiplome'] != null)
              ? DateTime.parse(data['dateDiplome'])
              : DateTime.now(),
          (data['dateConsentement'] != null)
              ? DateTime.parse(data['dateConsentement'])
              : DateTime.now()
          //DateTime.now()
          );
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<Visiteur> getLeVisiteurByID(int id) async {
    final resp = await http
        .get(Uri.http('127.0.0.2', '/API/visiteur.php', {"id": id.toString()}));

    if (resp.statusCode == 200) {
      var res = jsonDecode(resp.body);
      var data = res;

      return Visiteur.sansList(
          int.parse(data['idVisiteur']), data['nom'], data['prenom']);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<Visite>> getLesVisites() async {
    final resp = await http.get(Uri.http('127.0.0.2', '/API/visite.php'));

    if (resp.statusCode == 200) {
      var data = [];
      data = jsonDecode(resp.body)['data'];
      List<Visite> list = List.empty(growable: true);

      for (var d in data) {
        list.add(Visite(
            int.parse(d['idVisite']),
            await getLeMedecinsById(int.parse(d['idMedecin'])),
            await getLeVisiteurByID(int.parse(d['idVisiteur'])),
            d['adresse'],
            (d['dateViste'] != null) ? DateTime.parse(d['dateVisite']) : DateTime.now(),
            Produit(int.parse(d['idProd']), d['libelle'], d['posologie'])));
      }

      return list;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<Visite> getLaVisiteByID(int id) async {
    final resp = await http
        .get(Uri.http('127.0.0.2', '/API/visite.php', {"idVisite": id.toString()}));

    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body)['data'];
      return Visite(
          int.parse(data['idVisite']),
          await getLeMedecinsById(int.parse(data['idMedecin'])),
          await getLeVisiteurByID(int.parse(data['idVisiteur'])),
          data['adresse'],
          DateTime.parse(data['dateViste']),
          Produit(int.parse(data['idProd']), data['libelle'], data['posologie']));
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  static Future<bool> addVisite(Visite visite) async {
    final resp =
        await http.post(Uri.http('127.0.0.2', '/API/visite.php'), body: {
      "idMedecin": visite.getMedecin()?.getId().toString(),
      "idVisiteur": visite.getVisiteur()?.getId().toString(),
      "adresse": visite.getAdresse(),
      "dateVisite": visite.getDateVisite().toString(),
      "idProduit" : visite.getProduit()?.getId()
    });

    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Produit> getLeProdById(int id) async {
    final resp = await http
        .get(Uri.http('127.0.0.2', '/API/produit.php', {"id": id.toString()}));

    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body)['data'];
      return Produit(
          int.parse(data['idProd']),
          data['libelle'],
          data['posologie']);
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
