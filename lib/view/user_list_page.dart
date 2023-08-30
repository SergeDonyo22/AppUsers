import 'package:app_front_end/view/create_profile_page.dart';
import 'package:app_front_end/view/profile_modele.dart';
import 'package:app_front_end/view/user_profile.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  final List<UserProfile> userProfiles = [
    UserProfile(
        iconData: Icons.person, firstName: 'Serge', lastName: 'TAO', age: 20),
    UserProfile(
        iconData: Icons.person, firstName: 'Roger', lastName: 'CLOU', age: 23),
    UserProfile(
        iconData: Icons.person, firstName: 'Amir', lastName: 'BOUE', age: 30),
  ];
  UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userProfiles.length,
        itemBuilder: (context, index) {
          UserProfile userProfile = userProfiles[index];
          return ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.person,
                      color: Color.fromARGB(255, 16, 15, 15)),
                ),
              ),
              title: Text("${userProfile.firstName} ${userProfile.lastName}"),
              subtitle: Text("${userProfile.age} ans"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserProfilePage(userProfiles: userProfile)));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateProfile(),
            ),
          );
        },
        backgroundColor: Colors.black, // Couleur du bouton
        foregroundColor: Colors.white, // Couleur de l'icône
        child: const Icon(Icons.add),
      ),
    );
  }

  void _handleDelete(int index) {
    setState(() {
      UserProfile.removeAt(index);
    });
  }

  void setState(Null Function() param0) {}
}
