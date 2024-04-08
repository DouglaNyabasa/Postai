// import 'package:flutter/material.dart';
//
// import '../commons/widgets/text_field_widget.dart';
//
//
// class WeightFormScreen extends StatefulWidget {
//   const WeightFormScreen({super.key});
//
//   @override
//   _WeightFormScreenState createState() => _WeightFormScreenState();
// }
//
// class _WeightFormScreenState extends State<WeightFormScreen> {
//   int? _weight;
//   int _selectedType = 1;
//   bool _isLocal = true;
//   String? _selectedZone;
//   int? totalCost;
//   int? localRate;
//   int? internationalRate;
//
//   // Hardcoded Values for Rates
//   int? zoneOneRate = 1;
//   int? zoneTwoRate = 2;
//   int? zoneThreeRate = 3;
//
//   int? zoneARate = 2;
//   int? zoneBRate = 4;
//   int? zoneCRate = 6;
//   int? zoneDRate = 8;
//
//   int? typeOneRate = 1;
//   int? typeTwoRate = 2;
//   int? typeThreeRate = 3;
//
//   final TextEditingController _weightController = TextEditingController();
//
//   void _handleTypeChange(int? value) {
//     setState(() {
//       _selectedType = value ?? 1;
//     });
//   }
//
//   void _handleLocationChange(bool? value) {
//     setState(() {
//       _isLocal = value ?? true;
//       _selectedZone = null; // Reset selected zone when location changes
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weight Service'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             MyTextField(
//               controller: _weightController,
//               hint: "Weight",
//               icon: Icons.monitor_weight_rounded,
//               validation: (val) {
//                 if (val.isEmpty) {
//                   return "Weight is required";
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 20),
//             const Text('Mail Type:'),
//             Row(
//               children: [
//                 Radio(
//                   value: 1,
//                   groupValue: _selectedType,
//                   onChanged: _handleTypeChange,
//                 ),
//                 const Text('Type 1'),
//                 Radio(
//                   value: 2,
//                   groupValue: _selectedType,
//                   onChanged: _handleTypeChange,
//                 ),
//                 const Text('Type 2'),
//                 Radio(
//                   value: 3,
//                   groupValue: _selectedType,
//                   onChanged: _handleTypeChange,
//                 ),
//                 const Text('Type 3'),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Text('Location:'),
//             Row(
//               children: [
//                 Radio(
//                   value: true,
//                   groupValue: _isLocal,
//                   onChanged: _handleLocationChange,
//                 ),
//                 const Text('Local'),
//                 Radio(
//                   value: false,
//                   groupValue: _isLocal,
//                   onChanged: _handleLocationChange,
//                 ),
//                 const Text('International'),
//               ],
//             ),
//             const SizedBox(height: 20),
//             if (_isLocal) ...[
//               const Text('Zone:'),
//               DropdownButton<String>(
//                 value: _selectedZone,
//                 hint: const Text('Select Zone'),
//                 onChanged: (String? value) {
//                   setState(() {
//                     _selectedZone = value;
//                   });
//                 },
//                 items: <String>['Zone 1', 'Zone 2', 'Zone 3']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ] else ...[
//               const Text('Zone:'),
//               DropdownButton<String>(
//                 value: _selectedZone,
//                 hint: const Text('Select Zone'),
//                 onChanged: (String? value) {
//                   setState(() {
//                     _selectedZone = value;
//                   });
//                 },
//                 items: <String>['Zone A', 'Zone B', 'Zone C', 'Zone D']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ],
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_weightController.text.isNotEmpty &&
//                     _selectedType != null &&
//                     _selectedZone != null) {
//                   final int weight = int.parse(_weightController.text);
//                   int rate;
//                   int zone;
//
//                   if (_isLocal) {
//                     if (_selectedZone == 'Zone 1') {
//                       zone = zoneOneRate!;
//                     } else if (_selectedZone == 'Zone 2') {
//                       zone = zoneTwoRate!;
//                     } else {
//                       zone = zoneThreeRate!;
//                     }
//                     rate = localRate!;
//                   } else {
//                     if (_selectedZone == 'Zone A') {
//                       zone = zoneARate!;
//                     } else if (_selectedZone == 'Zone B') {
//                       zone = zoneBRate!;
//                     } else if (_selectedZone == 'Zone C') {
//                       zone = zoneCRate!;
//                     } else {
//                       zone = zoneDRate!;
//                     }
//                     rate = internationalRate!;
//                   }
//
//                   totalCost = _selectedType * zone * weight;
//
//                   print('Weight: ${_weightController.text}kg');
//                   print('Mail Type: $_selectedType');
//                   print('Location: ${_isLocal ? 'Local' : 'International'}');
//                   print('Zone: $_selectedZone');
//                   print('Total Cost: $totalCost');
//                 } else {
//                   print('Please fill out all fields.');
//                 }
//               },
//               child: const Text('Calculate'),
//             ),
//             Text('Total Cost: $totalCost'),
//           ],
//         ),
//       ),
//     );
//   }
// }