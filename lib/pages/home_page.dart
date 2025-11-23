import 'package:first_wtf_app/widgets/hospital_list.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSearchBar = false;
  String userSearch = "";
  TextEditingController userSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCall"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showSearchBar = !showSearchBar;
                userSearch = "";
                userSearchController.clear();
              });
            },
            icon: Icon(showSearchBar ? Icons.close : Icons.search),
          ),
        ],
        leading: Icon(Icons.menu),
      ),

      body: Column(
        children: [
          if (showSearchBar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: userSearchController,
                onChanged: (value) {
                  setState(() {
                    userSearch = value.toLowerCase().trim();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Hospital or Address",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          Expanded(
            child: DefaultTabController(
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
                    child: TabBarView(
                      children: [_buildMapView(), HospitalList(search: userSearch)],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(6.5244, 3.3792),
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}
