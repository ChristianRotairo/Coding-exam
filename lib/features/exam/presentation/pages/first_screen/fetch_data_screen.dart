import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/fetch_data_provider.dart';

class DisplayDataScreen extends StatefulWidget {
  const DisplayDataScreen({Key? key}) : super(key: key);

  @override
  State<DisplayDataScreen> createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {
  bool _isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      _isInitialized = true;
      // Trigger data fetch after the first build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<FetchDataProvider>().fetchData();
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('API Integration'),
      ),
      body: Center(
        child: Consumer<FetchDataProvider>(
          builder: (context, provider, child) {
            // if status is loading then we will show the circular loading
            if (provider.isLoading) {
              return const CircularProgressIndicator();
            } else if (provider.error != null) {
              // we will return the result if the data is fetched
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${provider.error}'),
                  ElevatedButton(
                    onPressed: () => provider.fetchData(),
                    child: const Text('Retry'),
                  ),
                ],
              );
            } else if (provider.data.isNotEmpty) {
              return Text(
                'Random String: ${provider.data[0].randomString}',
                style: const TextStyle(fontSize: 18),
              );
            } else {
              return const Text('No data available');
            }
          },
        ),
      ),
    );
  }
}