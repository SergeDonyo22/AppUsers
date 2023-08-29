import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_front_end/view/notification_model.dart'; // Assurez-vous d'importer le modèle de notification si vous en avez un

class NotificationPage extends StatelessWidget {
  final List<NotificationModel> notifications = [
    NotificationModel(
      iconData: Icons.notifications,
      message: 'User create',
      date: DateTime.now(),
    ),
    NotificationModel(
      iconData: Icons.notifications,
      message: 'User delete',
      date: DateTime.now(),
    ),
    // Ajoutez d'autres notifications ici
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          NotificationModel notification = notifications[index];
          String formattedDate = DateFormat.Hm().format(notification.date);
          return ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Couleur du cercle
              ),
              child: Center(
                child: Icon(
                  notification.iconData,
                  color: Colors.white, // Couleur de l'icône
                ),
              ),
            ),
            title: Text(notifications[index].message),
            trailing: Text(formattedDate), // Affiche l'heure à droite du message
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: 1, // Index de l'élément sélectionné actuellement
        selectedItemColor: Colors.black, // Couleur des icônes sélectionnées
        unselectedItemColor: Colors.grey, // Couleur des icônes non sélectionnées
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); // Revenir à la page de liste d'utilisateurs
          }
        },
      ),
    );
  }
}
