import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KnowYourMedicineScreen extends StatefulWidget {
  @override
  _KnowYourMedicineScreenState createState() => _KnowYourMedicineScreenState();
}

class _KnowYourMedicineScreenState extends State<KnowYourMedicineScreen> {
  Future<Map<String, dynamic>>? _medicineDataFuture;
  final _controller = TextEditingController();

  Future<Map<String, dynamic>> fetchMedicineData(String query) async {
    final apiKey =
        'D81wRFa9QXRPfKnxhRV1uEIFRNw7BE7k2LiMZyrv'; // Replace with your API key
    final response = await http.get(
      Uri.parse(
          'https://api.fda.gov/drug/label.json?search=${query}&api_key=${apiKey}'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load medicine data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue.shade100,
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.lightBlue.shade100,
          secondary: Colors.pink.shade100,
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
        cardColor: Colors.grey.shade800, // Pastel card background
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue.shade100, // Pastel color for headlines
          ),
          bodyLarge: TextStyle(
            fontSize: 18.0,
            color: Colors.white70, // Lighter text for readability
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Know Your Medicine",
            style: TextStyle(
              color: Colors.lightBlue.shade100,
            ), // Updated to pastel colors for dark mode
          ),
          elevation: 0.0,
          backgroundColor:
              Colors.grey.shade900, // Dark background for the app bar
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(15.0)),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.grey.shade900, // Match the dark background
              ),
            ),
          ),
          leadingWidth: 70,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Search medicine',
                  labelStyle: TextStyle(color: Colors.lightBlue.shade100),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.lightBlue.shade100),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _medicineDataFuture = fetchMedicineData(_controller.text);
                    });
                  },
                  icon: Icon(Icons.local_pharmacy, color: Colors.black),
                  label: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue.shade100,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: _medicineDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink.shade100,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      var results = snapshot.data?['results'] ?? [];
                      if (results.isEmpty) {
                        return Center(child: Text('No data available'));
                      }

                      var medicineData = results[0];
                      return ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        children: [
                          SizedBox(height: 10),
                          if (medicineData['openfda'] != null &&
                              medicineData['openfda']['brand_name'] != null &&
                              medicineData['openfda']['brand_name'].isNotEmpty)
                            _buildExpansionTile(
                              title: 'Brand Name',
                              content: medicineData['openfda']['brand_name'][0],
                              context: context,
                            ),
                          if (medicineData['indications_and_usage'] != null &&
                              medicineData['indications_and_usage'].isNotEmpty)
                            _buildExpansionTile(
                              title: 'Usage',
                              content: medicineData['indications_and_usage'][0]
                                  .toString(),
                              context: context,
                            ),
                          if (medicineData['dosage_and_administration'] !=
                                  null &&
                              medicineData['dosage_and_administration']
                                  .isNotEmpty)
                            _buildExpansionTile(
                              title: 'Dosage',
                              content: medicineData['dosage_and_administration']
                                      [0]
                                  .toString(),
                              context: context,
                            ),
                          if (medicineData['general_precautions'] != null &&
                              medicineData['general_precautions'].isNotEmpty)
                            _buildExpansionTile(
                              title: 'General Precautions',
                              content: medicineData['general_precautions'][0]
                                  .toString(),
                              context: context,
                            ),
                          if (medicineData['storage_and_handling'] != null &&
                              medicineData['storage_and_handling'].isNotEmpty)
                            _buildExpansionTile(
                              title: 'Storage and Handling',
                              content: medicineData['storage_and_handling'][0]
                                  .toString(),
                              context: context,
                            ),
                          SizedBox(height: 10),
                        ],
                      );
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required String content,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Added spacing
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Curved edges for tiles
        ),
        color: Colors.grey.shade800, // Dark mode card background
        elevation: 3, // Slight elevation for better appearance
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              15), // Make sure the expansion tile has curved edges when closed
          child: ExpansionTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Color.fromARGB(255, 119, 210, 252),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  content.length < 1000
                      ? content
                      : content.substring(0, 1000) + '...',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
            tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            childrenPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            collapsedBackgroundColor: Colors.grey.shade800,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
