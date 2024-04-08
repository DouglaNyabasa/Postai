// import 'package:flutter/material.dart';
//
//
//
// class CostCalculatorScreen extends StatefulWidget {
//   @override
//   _CostCalculatorScreenState createState() => _CostCalculatorScreenState();
// }
//
// class _CostCalculatorScreenState extends State<CostCalculatorScreen> {
//   final List<String> mailTypes = ['Mail 1', 'Mail 2', 'Mail 3', 'Mail 4'];
//   final List<String> locationTypes = ['A', 'B', 'C'];
//
//   String selectedMailType;
//   String selectedLocationType;
//   double weight;
//   double totalCost = 0.0;
//
//   void calculateTotalCost() {
//     setState(() {
//       if (selectedMailType != null && selectedLocationType != null &&
//           weight != null) {
//         double mailCost;
//         if (selectedMailType == 'Mail 1') {
//           mailCost = 2.0;
//         } else if (selectedMailType == 'Mail 2') {
//           mailCost = 3.0;
//         } else if (selectedMailType == 'Mail 3') {
//           mailCost = 4.0;
//         } else if (selectedMailType == 'Mail 4') {
//           mailCost = 5.0;
//         }
//
//         if (selectedLocationType == 'A') {
//           totalCost = weight * mailCost * 1.2;
//         } else if (selectedLocationType == 'B') {
//           totalCost = weight * mailCost * 1.5;
//         } else if (selectedLocationType == 'C') {
//           totalCost = weight * mailCost * 1.8;
//         }
//       } else {
//         totalCost = 0.0;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cost Calculator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               DropdownButtonFormField<String>(
//                 // value: selectedMailType,
//                 decoration: InputDecoration(
//                   labelText: 'Mail Type',
//                 ),
//                 items: mailTypes.map((type) {
//                   return DropdownMenuItem<String>(
//                     value: type,
//                     child: Text(type),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   // setState(() {
//                   //   selectedMailType = value;
//                   // });
//                   // calculateTotalCost();
//                 },
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           labelText: 'International Mail',
//                         ),
//                         onChanged: (value) {
//                           // setState(() {
//                           //   weight = double.tryParse(value);
//                           // });
//                           // calculateTotalCost();
//                         },
//                       ),
//                     ),
//                     SizedBox(width: 16.0),
//                     DropdownButtonFormField<String>(
//                       // value: selectedLocationType,
//                       items: locationTypes.map((type) {
//                         return DropdownMenuItem<String>(
//                           value: type,
//                           child: Text(type),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         // setState(() {
//                         //   selectedLocationType = value;
//                         // });
//                         // calculateTotalCost();
//                       },
//                     ),
//                   ]
//               ),
//               SizedBox(height: 16,),
//               Text(
//                 'Total Cost $totalCost',
//                 style: TextStyle(
//                     fontSize: 20.0, fontWeight: FontWeight.bold
//                 ),
//               ),
//             ]
//         ),
//       ),
//     );
//   }
// }
