import 'Medecin.dart';
import 'Visiteur.dart';
import 'Produit.dart';

class Visite {
  int _id = 0;
  Medecin? _medecin;
  Visiteur? _visiteur;
  String _adresse = "";
  DateTime _dateVisite = DateTime.now();
  Produit? _prod;

  Visite.sansArg() {}

  // Visite(int id, Medecin medecin, Visiteur visiteur, String adresse,
  //     DateTime dateVisite) {
  //   _id = id;
  //   _medecin = medecin;
  //   _visiteur = visiteur;
  //   _adresse = adresse;
  //   _dateVisite = dateVisite;
  // }

  Visite(int id, Medecin medecin, Visiteur visiteur, String adresse,
      DateTime dateVisite, Produit prod) {
    _id = id;
    _medecin = medecin;
    _visiteur = visiteur;
    _adresse = adresse;
    _dateVisite = dateVisite;
    _prod = prod;
  }

  int getId() {
    return _id;
  }

  Medecin? getMedecin() {
    return _medecin;
  }

  Visiteur? getVisiteur() {
    return _visiteur;
  }

  String getAdresse() {
    return _adresse;
  }

  DateTime getDateVisite() {
    return _dateVisite;
  }

  void setMedecin(Medecin medecin) {
    _medecin = medecin;
  }

  void setVisite(Visiteur visiteur) {
    _visiteur = visiteur;
  }

  void setAdresse(String adresse) {
    _adresse = adresse;
  }

  void setDateVisite(DateTime dateVisite) {
    _dateVisite = dateVisite;
  }

  void setProduit(Produit prod) {
    _prod = prod;
  }

  Produit? getProduit() {
    return _prod;
  }
}
