import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_passwordtextfield.dart';
import 'package:flutter/material.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Information"), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),

        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 80)),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue,
                    child: IconButton(icon:
                     Icon(Icons.camera_alt,size: 18,
                      color: Colors.white, ) ,onPressed: (){},
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          personalInfoTextFeild("Full Name","John Doe"),
          personalInfoTextFeild("Email Address","johndoe@gmail.com"),
          Text("Phone Number", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 6),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "+234 8169519043",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),

          Text("Gender", style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 6),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: [
              DropdownMenuItem(value: "Male", child: Text("Male")),
              DropdownMenuItem(value: "Female", child: Text("Female")),
            ],
            onChanged: (value) {},
          ),
          SizedBox(height: 10),
          personalInfoTextFeild("Address","1, Sowole Street, Lagos"),
          personalInfoTextFeild("Occupation","Farmer"),
          Text(
            "Change Password",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 6),
          CustomPasswordField(label: "New Password"),
          SizedBox(height: 20),

          CustomButton(buttonText: "Save", onTap: () {}),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Column personalInfoTextFeild(String label, String hint) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
