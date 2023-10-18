import 'Visite.dart';

class Medecin{
  int _id = 0;
  String _nom  = "";
  String _prenom = "";
  String _mail = "";
  String _motDePasse = "";
  DateTime _dateCreation = DateTime.now();
  String _rpps = "";
  DateTime _dateDiplome = DateTime.now();
  DateTime _dateConsentement = DateTime.now();

  Medecin(int id, String nom, String prenom, String mail, String motDePasse, DateTime dateCreation, String rpps, DateTime dateDiplome, DateTime dateConsentement){
    _id = id;
    _nom = nom;
    _prenom = prenom;
    _mail = mail;
    _motDePasse = motDePasse;
    _dateCreation = dateCreation;
    _rpps = rpps;
    _dateDiplome = dateDiplome;
    _dateConsentement = dateConsentement;
  }

  int getId(){
    return _id;
  }

  String getNom(){
    return _nom;
  }

  String getPrenom(){
    return _prenom;
  }

  String getMail(){
    return _mail;
  }

  String getMotDePasse(){
    return _motDePasse;
  }
  
  DateTime getDateCreation(){
    return _dateCreation;
  }

  String getRpps(){
    return _rpps;
  }

  DateTime getDateDiplome(){
    return _dateCreation;
  }

  DateTime getDateConsentement(){
    return _dateConsentement;
  }

  void setNom(String nom){
    _nom = nom;
  }

  void setPrenom(String prenom){
    _prenom = prenom;
  }

  void setMail(String mail){
    _mail = mail;
  }

  void setMotDePasse(String motDePasse){
    _motDePasse = motDePasse;
  }

  void setRpps(String rpps){
    _rpps = rpps;
  }

  void setDateDiplome(DateTime dateDiplome){
    _dateDiplome = dateDiplome;
  }

  void setDateConsentement(DateTime dateConsentement){
    _dateConsentement = dateConsentement;
  }

  @override
  String toString(){
    String message = 
    "Id : $_id \nNom : $_nom \nPrenom : $_prenom \nMail : $_mail \nMot de passe : $_motDePasse \nDate de creation : $_dateCreation \nRpps : $_rpps \nDate de Diplome : $_dateDiplome \nDate de Consentement $_dateConsentement" ;
    return message;
  }

}