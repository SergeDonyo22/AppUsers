import 'package:app_front_end/view/edit_profile.dart';
import 'package:app_front_end/view/profile_modele.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final UserProfile userProfiles;
  final VoidCallback? onDelete;

  const UserProfilePage({super.key, required this.userProfiles, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(20),
                color: Colors.grey[300],
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Color.fromARGB(255, 199, 197, 197),
                      child:
                          Icon(Icons.person, color: Colors.black, size: 40.0),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Nom: ${userProfiles.lastName} ${userProfiles.firstName}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Age: ${userProfiles.age} ans',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 49),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    _showEditConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Edit User',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Delete User',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditConfirmationDialog(BuildContext context) async {
    final bool shouldEdit = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Edit'),
          content: const Text('Are you sure you want to edit the user?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm edit
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel edit
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );

    if (shouldEdit) {
      //   // Navigate to EditProfilePage
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UpdateProfile()),
      );
    }
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final bool shouldDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm delete'),
          content: const Text('Are you sure you want to delete the user?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm delete
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel delete
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );

    if (shouldDelete) {
      onDelete?.call(); // Supprimer l'utilisateur de la liste
      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Revenir à la liste des utilisateurs
    }
  }
}
