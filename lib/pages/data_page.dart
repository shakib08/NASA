// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/nasa_api_provider.dart';

// class DataPage extends ConsumerWidget {
//   final String dateRange;

//   DataPage({required this.dateRange});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dataAsync = ref.watch(nasaAPIProvider(dateRange));

//     return Scaffold(
//       appBar: AppBar(title: Text('NASA Pictures')),
//       body: dataAsync.when(
//         data: (pictures) => ListView.builder(
//           itemCount: pictures.length,
//           itemBuilder: (context, index) {
//             final picture = pictures[index];
//             return Card(
//               child: ListTile(
//                 title: Text(picture.title ?? 'No Title'),
//                 subtitle: Text(picture.date ?? 'No Date'),
//                 leading: Image.network(picture.url ?? ''),
//               ),
//             );
//           },
//         ),
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('Error: $error')),
//       ),
//     );
//   }
// }












import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/nasa_api_provider.dart';

class DataPage extends ConsumerWidget {
  final String dateRange;

  DataPage({required this.dateRange});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(nasaAPIProvider(dateRange));

    return Scaffold(
      appBar: AppBar(title: Text('NASA Pictures')),
      body: dataAsync.when(
        data: (pictures) => ListView.builder(
          itemCount: pictures.length,
          itemBuilder: (context, index) {
            final picture = pictures[index];
            return Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (picture.url != null)
                      Image.network(
                        picture.url!,
                        height: 300,  
                        width: double.infinity,  
                        fit: BoxFit.cover,  // Ensure the image covers the available area
                      ),
                    SizedBox(height: 16),  // Space between image and text
                    // Title and Date below the image
                    Text(
                      picture.title ?? 'No Title',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),  // Space between title and date
                    Text(
                      picture.date ?? 'No Date',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),  // Space between text and next card
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

