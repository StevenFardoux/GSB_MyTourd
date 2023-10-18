import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mytour/class/Passerelle.dart';
import 'package:mytour/class/Visite.dart';
import 'package:mytour/class/Visiteur.dart';

// a page to add a new visite
class AddVisite extends StatefulWidget {
  const AddVisite({Key? key}) : super(key: key);

  @override
  _AddVisiteState createState() => _AddVisiteState();
}

class _AddVisiteState extends State<AddVisite> {
  final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _medecinController = TextEditingController();
  final _adresseController = TextEditingController();
  final _dateController = TextEditingController();
  final _produitController = TextEditingController();
  int _idProd = 0;

  @override
  void dispose() {
    _medecinController.dispose();
    _adresseController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une Visite"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _medecinController,
                decoration: const InputDecoration(
                  labelText: "Medecin",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer l'id du medecin";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _adresseController,
                decoration: const InputDecoration(
                  labelText: "Adresse",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer l'adresse";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: "Date",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer la date";
                  }
                  return null;
                },
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2030),
                  );
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() {
                        // 2012-02-27 13:27:00
                        _dateController.text = "";
                        _dateController.text += date.year.toString() + "-";

                        if (date.month < 10) {
                          _dateController.text += "0";
                        }
                        _dateController.text += date.month.toString() + "-";

                        if (date.day < 10) {
                          _dateController.text += "0";
                        }
                        _dateController.text += date.day.toString() + " ";

                        if (time.hour < 10) {
                          _dateController.text += "0";
                        }
                        _dateController.text += time.hour.toString() + ":";

                        if (time.minute < 10) {
                          _dateController.text += "0";
                        }
                        _dateController.text += time.minute.toString() + ":00";

                        // _dateController.text =
                        //     "${date.day}/${date.month}/${date.year} ${time.hour}:${time.minute}";
                      });
                    }
                  }
                },
              ),
               TextFormField(
                controller: _produitController,
                decoration: const InputDecoration(
                  labelText: "Produit",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez entrer l'id du produit";
                  }
                  _idProd = int.parse(value);
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // print("medecin: ${_medecinController.text}\n"
                    //     "adresse: ${_adresseController.text}\n"
                    //     "date: ${_dateController.text}");
                    // _dateController.text is not formated for DateTime.parse

                    Passerelle.addVisite(Visite(
                      0,
                      await Passerelle.getLeMedecinsById(int.parse(_medecinController.text)),
                      Visiteur.sansList(2, "nom", "prenom"),
                      _adresseController.text,
                      DateTime.parse(_dateController.text),
                      await Passerelle.getLeProdById(int.parse(_produitController.text))));
                      
                      
                      
                      // Visite(
                      //   0,
                      //   await Passerelle.getLeMedecinsById(2),
                      //   Visiteur.sansList(2, "nom", "prenom"),
                      //   _adresseController.text,
                      //   DateTime.parse(_dateController.text)),
                      //   await Passerelle.getLeProdById(int.parse(_produitController.text))
                      //   );
                  }
                },
                child: const Text("Valider"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
