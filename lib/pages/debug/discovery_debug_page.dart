import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:WorqSend_app/provider/logging/discovery_logs_provider.dart';
import 'package:WorqSend_app/provider/network/nearby_devices_provider.dart';
import 'package:WorqSend_app/widget/copyable_text.dart';
import 'package:WorqSend_app/widget/responsive_list_view.dart';

final _dateFormat = DateFormat.Hms();

class DiscoveryDebugPage extends ConsumerWidget {
  const DiscoveryDebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(discoveryLogsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Requests'),
      ),
      body: ResponsiveListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () => ref.read(nearbyDevicesProvider.notifier).startMulticastScan(),
                child: const Text('Resend Requests'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => ref.read(discoveryLogsProvider.notifier).clear(),
                child: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...logs.map((log) => CopyableText(
                prefix: TextSpan(
                  text: '[${_dateFormat.format(log.timestamp)}] ',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                name: log.log,
                value: log.log,
              )),
        ],
      ),
    );
  }
}
