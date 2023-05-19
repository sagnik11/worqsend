import 'package:flutter/material.dart';
import 'package:WorqSend_app/gen/strings.g.dart';
import 'package:WorqSend_app/pages/debug/debug_page.dart';
import 'package:WorqSend_app/widget/worq_send_logo.dart';
import 'package:WorqSend_app/widget/responsive_list_view.dart';
import 'package:routerino/routerino.dart';
import 'package:url_launcher/url_launcher.dart';

final _body = '''
          WorqSend is an app to share files and messages between nearby devices using the local wifi network.
          
          The communication between devices is entirely end-to-end encrypted via HTTPS and SHA256.
          No Internet required. No tracking*. No ads.
          
          Currently, this app is available on Android, iOS, macOS, Windows and Linux. You can find all download options on the official homepage.

          *The operating system may still gather usage data.
          '''
    .splitMapJoin(
  RegExp(r'^', multiLine: true),
  onMatch: (_) => '\n',
  onNonMatch: (n) => n.trim(),
);

class AboutPage extends StatelessWidget {
  const AboutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.aboutPage.title),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 20),
          const WorqSendLogo(),
          Text(
            '© ${DateTime.now().year} WorqHat',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse('https://worqhat.com'));
              },
              child: const Text('worqhat.com'),
            ),
          ),
          Text(_body),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () async {
                  await launchUrl(Uri.parse('https://worqhat.com'));
                },
                child: const Text('Homepage'),
              ),
              TextButton(
                onPressed: () async {
                  await launchUrl(Uri.parse('https://opensource.org/licenses/MIT'));
                },
                child: const Text('MIT License'),
              ),
              TextButton(
                onPressed: () async {
                  await context.push(() => const LicensePage());
                },
                child: const Text('License Notices'),
              ),
              TextButton(
                onPressed: () async {
                  await context.push(() => const DebugPage());
                },
                child: const Text('Debugging'),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
