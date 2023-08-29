import 'package:app_front_end/view/create_profile_page.dart';
import 'package:app_front_end/view/notification_page.dart';
import 'package:app_front_end/view/profile_modele.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  final List<UserProfile> userProfiles;

  const UserListPage({super.key, required this.userProfiles});

  /*List<Map<String, dynamic>> users = [
    {"name": "Aubin DONYO", "age": 24},
    { "name": "Emilie ETONAM", "age": 20 },
    { "name": "Ange TAO", "age": 07},
    { "name": "Précieuse MABLE", "age": 19 }
  ]; */

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
                child:
                    Icon(Icons.person, color: Color.fromARGB(255, 16, 14, 14)),
              ),
            ),
            title: Text('${userProfile.firstName} ${userProfile.lastName}'),
            subtitle: Text('Âge: ${userProfile.age}'),
          );
        },
      ),
    bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.black
          ),
        ],
        currentIndex: 0, // Index de l'élément sélectionné actuellement
        selectedItemColor: Colors.black, // Couleur des icônes sélectionnées
        unselectedItemColor: Colors.grey, // Couleur des icônes non sélectionnées
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPage(), // Page de notification
              ),
            );
          }
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
}
