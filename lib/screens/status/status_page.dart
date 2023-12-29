import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            Text(kIsWeb ? 'App is running on Web' : 'App is running on mobile'),
      ),
    );
  }
}
