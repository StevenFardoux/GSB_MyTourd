import 'Visite.dart';

class Visiteur{
  int _id = 0;
  String _nom = "";
  String _prenom = "";
  List<Visite> _listVisite = List.empty(growable: true);
  

  Visiteur.sansList(int id, String nom, String prenom){
    _id = id;
    _nom = nom;
    _prenom = prenom;
  }
  
  Visiteur(int id, String nom, String prenom, List<Visite> listVisite){
    _id = id;
    _nom = nom;
    _prenom = prenom;
    _listVisite = listVisite;
  }

    int getId(){
    return _id;
  }

    String getNom() {
    return _nom;
  }

  String getPrenom() {
    return _prenom;
  }

  List<Visite> getListVisite(){
    return _listVisite;
  }

  void setNom(String nom) {
    _nom = nom;
  }

  void setPrenom(String prenom) {
    _prenom = prenom;
  }

  void setListVisite(List<Visite> listVisite){
    _listVisite = listVisite;
  }

    @override
  String toString(){
    String message = 
    "Id : $_id \nNom : $_nom \nPrenom : $_prenom ";
    return message;
  }




}