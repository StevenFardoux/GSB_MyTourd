class Produit {
  int? _id;
  String _libelle = "";
  String? _posologie;
  
  Produit(int id, String libelle, String posologie) {
    _id = id;
    _libelle = libelle;
    _posologie = posologie;
  }

  int? getId() {
    return _id;
  }
  
  void setLibelle(String libelle) {
    _libelle = libelle;
  }

  String getLibelle() {
    return _libelle;
  }

  void setPosologie(String poso) {
    _posologie = poso;
  }

  String? getPosologie() {
    return _posologie;
  }
}