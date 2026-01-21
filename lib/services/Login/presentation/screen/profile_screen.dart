import 'package:ashghal/services/Login/domain/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:ashghal/core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary mock data
    const user = User(


      fullName: 'Mohamed Wael',
      email: 'mo.wael@gmail.com',
      mobileNo: '+20 100 123 4567',
      natId: 1234567891212,
      userName: 'Mohamed Wael ', password: '', whatsNo: '+20 100 123 4567',
    );
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.primary,
                    child: const Icon(Icons.person, size: 50,color: Colors.white,),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    user.email,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  ProfileItem(
                    icon: Icons.phone,
                    title: 'Phone',
                    value: user.mobileNo,
                  ),

                  // ProfileItem(
                  //   icon: Icons.location_on,
                  //   title: 'Address',
                  //   value: user.natId.toString,
                  // ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      // TODO: navigate to edit profile
                    },
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
  

}
class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}

