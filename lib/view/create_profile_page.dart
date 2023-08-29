import 'dart:io';
import 'package:app_front_end/view/profile_modele.dart';
import 'package:app_front_end/view/user_list_page.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late UserProfile _userProfile;
  final List<UserProfile> _userProfiles = [];
  String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
    _userProfile = UserProfile(firstName: '', lastName: '', age: 0);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Enregistrement des informations dans une liste
      _userProfile.add(_userProfile);

      // Naviguer vers la page de liste des utilisateurs
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Profile',
          style: TextStyle(
            color: Colors.white, // Couleur du texte de l'AppBar
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black, // Couleur noire pour l'AppBar
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () async {
            //final pickedImage =
                //await ImagePicker().getImage(source: ImageSource.gallery);
            //if (pickedImage != null) {
              //setState(() {
                //_selectedImagePath = pickedImage.path;
              //});
            },
          //},
          child: ListView(
            children: [
              Center(
                child: Stack(children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      shape: BoxShape.circle,
                      image: _selectedImagePath != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(_selectedImagePath!)),
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.black),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ))
                ]),
              ),
              const SizedBox(height: 30),
              buildTextField(context),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16), // Ajoutez de l'espace ici
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Prénom',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Modifier la valeur du rayon selon vos préférences
              ),
            ),
            onSaved: (value) => _userProfile.firstName = value!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un prénom';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nom',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Modifier la valeur du rayon selon vos préférences
              ),
            ),
            onSaved: (value) => _userProfile.lastName = value!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un nom';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Âge',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Modifier la valeur du rayon selon vos préférences
              ),
            ),
            keyboardType: TextInputType.number,
            onSaved: (value) => _userProfile.age = int.parse(value!),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un âge';
              }
              final age = int.tryParse(value);
              if (age == null || age <= 0) {
                return 'Veuillez entrer un âge valide';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //_formKey.currentState!.save();
                    // Enregistrement des informations dans une liste
                    //_userProfile.add(_userProfile);
                    // Naviguer vers la page de liste des utilisateurs
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserListPage(userProfiles: _userProfiles),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.black, // Couleur de fond noire
                ),
                child: const Text('Save'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
