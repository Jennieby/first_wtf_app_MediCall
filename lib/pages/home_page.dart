import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCall"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/search");
              },
              child: Icon(Icons.search),
            ),
          ),
        ],
        leading: Icon(Icons.menu),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Map"),
                Tab(text: "List"),
              ],
            ),
            Expanded(
              child: TabBarView(children: [_buildMapView(), _buildListView()]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: [
        HospitalCard(hospitalName: "Alpha Clinic", hospitalLocation: "Abuja"),
        HospitalCard(
          hospitalName: "Oak Valley Hospital",
          hospitalLocation: "Calabar, Cross River",
        ),
        HospitalCard(
          hospitalName: "Community Medical Center",
          hospitalLocation: "Surulere, Lagos",
        ),
        HospitalCard(
          hospitalName: "City General Hospital",
          hospitalLocation: "Abuja",
        ),
        HospitalCard(
          hospitalName: "St. Lukes Hospital",
          hospitalLocation: "Asaba, Delta",
        ),
        HospitalCard(
          hospitalName: "St. Joseph Hospital",
          hospitalLocation: "Warri, Delta",
        ),
        HospitalCard(
          hospitalName: "Federal Medical Center",
          hospitalLocation: "Kogi",
        ),
        HospitalCard(
          hospitalName: "Tulip Clinic",
          hospitalLocation: "Benin, Edo",
        ),
        HospitalCard(
          hospitalName: "St. Mary's Hospital",
          hospitalLocation: "Abuja",
        ),
        HospitalCard(
          hospitalName: "Federal Medical Center",
          hospitalLocation: "Abuja",
        ),
        HospitalCard(
          hospitalName: "Federal Medical Center",
          hospitalLocation: "Yenogoa, Bayelsa",
        ),
        HospitalCard(
          hospitalName: "Federal Medical Center",
          hospitalLocation: "Ibadan, Oyo",
        ),
        HospitalCard(
          hospitalName: "Irrua Specialist Hospital",
          hospitalLocation: "Irrua, Edo",
        ),
        HospitalCard(hospitalName: "Zoe Clinic", hospitalLocation: "Kaduna"),
      ],
    );
  }

  Widget _buildMapView() {
    return ListView(
      children: [
        Image.asset(
          "assets/map.png",
          // why did we add this media query??
          // width: MediaQuery.sizeOf(context).width * 0.8,
          // height: MediaQuery.sizeOf(context).height * 0.8,
          // fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class HospitalCard extends StatelessWidget {
  const HospitalCard({
    super.key,
    required this.hospitalName,
    required this.hospitalLocation,
  });
  final String hospitalName;
  final String hospitalLocation;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.brown.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FaIcon(
            FontAwesomeIcons.staffSnake,
            color: Colors.brown.shade300,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(hospitalName),
        subtitle: Text(hospitalLocation),
      ),
    );
  }
}
