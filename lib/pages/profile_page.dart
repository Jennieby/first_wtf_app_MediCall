import 'package:first_wtf_app/models/user_details.dart';
import 'package:first_wtf_app/pages/emergency_contacts_page.dart';
import 'package:first_wtf_app/pages/notifications_page.dart';
import 'package:first_wtf_app/pages/personal_information_page.dart';
import 'package:first_wtf_app/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var userProv = Provider.of<UserNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfileDetails(),

          _buildAccountSection(),
          SizedBox(height: 10),
          _buildSupportSection(),
          SizedBox(height: 40),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {
              userProv.logout();
              Navigator.of(context).pushReplacementNamed("/login");
            },
            label: Text(
              "Logout",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            icon: Icon(Icons.logout, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Column _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          title: Text("Help Center"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        Divider(),
        ListTile(
          title: Text("Contact Us"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return PersonalInformationPage();
                },
              ),
            );
          },
          title: Text("Personal Information"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        Divider(),

        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return EmergencyContactsPage();
                },
              ),
            );
          },
          title: Text("Emergency Contacts"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NotificationsPage();
                },
              ),
            );
          },
          title: Text("Notifications"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    );
  }

  Widget _buildProfileDetails() {
    UserDetails? user = Provider.of<UserNotifier>(context).loggedInUser;
    if (user == null) return Text("User details not set");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          clipBehavior: Clip.hardEdge,
          child:user.profilePicture.isEmpty? Icon(Icons.person, size: 100,): Image.network(
            
            user.profilePicture,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        // CircleAvatar(radius: 50, child: Icon(Icons.person, size: 80)),
        SizedBox(height: 10),
        Text(
          user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        Text(user.email, style: TextStyle(fontWeight: FontWeight.w200)),
      ],
    );
  }
}
