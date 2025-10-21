import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacted Hospitals",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: "Search by hospital name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          HospitalCard(
            hospitalContact: HospitalContact(
              hospitalName: "City General Hospital",
              hospitalLocation: "52, Inkwell road, Abuja",
            ),
            hospitalName: "City General Hospital",
            lastContact: "November 12, 2025",
          ),
          HospitalCard(
            hospitalContact: HospitalContact(
              hospitalName: "Community Medical Center",
              hospitalLocation: "10, Aqualox Crescent, Surulere, Lagos",
            ),
            hospitalName: "Community Medical Center",
            lastContact: "July 26, 2024",
          ),
          HospitalCard(
            hospitalContact: HospitalContact(
              hospitalName: "Oak Valley Hospital",
              hospitalLocation: "New Man Estate, Building 8, Calabar",
            ),
            hospitalName: "Oak Valley Hospital",
            lastContact: "May 3, 2024",
          ),
          HospitalCard(
            hospitalContact: HospitalContact(
              hospitalName: "St. Lukes Hospital",
              hospitalLocation: "22, Mariam Babangida Road, Asaba, Delta",
            ),
            hospitalName: "St. Lukes Hospital",
            lastContact: "January 2, 2024",
          ),
        ],
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  const HospitalCard({
    super.key,
    required this.hospitalContact,
    required this.hospitalName,
    required this.lastContact,
  });
  final HospitalContact hospitalContact;
  final String hospitalName;
  final String lastContact;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return hospitalContact;
            },
          );
        },
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.add_box_outlined,
            color: Colors.blueAccent.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(
          hospitalName,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "Last contacted: $lastContact",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        trailing: Icon(Icons.info_outline, color: Colors.blueAccent.shade400),
      ),
    );
  }
}

class HospitalContact extends StatelessWidget {
  const HospitalContact({
    super.key,
    required this.hospitalName,
    required this.hospitalLocation,
  });
  final String hospitalName;
  final String hospitalLocation;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),

      children: [
        Text(
          hospitalName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),

        Text(
          hospitalLocation,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green.shade100,
              foregroundColor: Colors.green,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.call_outlined),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              foregroundColor: Colors.blueAccent.shade400,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.message_outlined),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text("History", style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
