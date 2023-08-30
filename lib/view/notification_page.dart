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
    NotificationModel(
      iconData: Icons.notifications,
      message: 'User update',
      date: DateTime.now(),
    )
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
    );
  }
}
