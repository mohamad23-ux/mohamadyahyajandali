import 'package:flutter/material.dart';
import 'package:portofolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "لا يمكن فتح الرابط: $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.black54,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "تواصل معي",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildContactRow(Icons.location_on, "📍 سوريا، دمشق"),
                  _buildContactRow(Icons.email, "📧 mohamadyahyajandali@gmail.com"),
                  _buildLinkRow(Icons.code, "GitHub: mohamad23-ux", "https://github.com/mohamad23-ux"),
                  _buildLinkRow(Icons.business, "LinkedIn: mohamad-yahya-jandali", "https://linkedin.com/in/mohamad-yahya-jandali"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orangeAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow(IconData icon, String text, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orangeAccent),
          const SizedBox(width: 12),
          Expanded(
            child: InkWell(
              onTap: () => _launchURL(url),
              child: Text(
                text,
                style: const TextStyle(color: Colors.blueAccent, fontSize: 18, decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
