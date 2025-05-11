import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelplineScreen extends StatelessWidget {
  final List<Map<String, String>> helplines = [
    {"name": "Helpline 1", "phone": "9152987821"},
    {"name": "Helpline 2", "phone": "0261 6554050"},
    {"name": "National Helpline (ICare)", "phone": "9152987821"},
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF1E1E2C),
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF1E1E2C),
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          title: Text(
            "Helplines",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFB2EBF2),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: ListView.builder(
            itemCount: helplines.length,
            itemBuilder: (context, index) {
              final helpline = helplines[index];
              return Card(
                color: Color(0xFF2E2E3E),
                shadowColor: Color(0xFF5E5E6E).withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  title: Text(
                    helpline['name']!,
                    style: TextStyle(
                      color: Color(0xFFB2EBF2),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    helpline['phone']!,
                    style: TextStyle(
                      color: Color(0xFFE0F7FA),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () => _makePhoneCall(helpline['phone']!),
                ),
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Color(0xFFB2EBF2),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Icon(Icons.home, color: Colors.black87),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              backgroundColor: Color(0xFFB2EBF2),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.edit, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
