import 'package:flutter/material.dart';
import 'package:postai/commons/widgets/text_field_widget.dart';
import 'package:postai/data/models/location.dart';
import 'package:postai/data/models/mail_type.dart';
import 'package:postai/data/models/zones.dart';

class WeightFormScreen extends StatefulWidget {
  const WeightFormScreen({super.key});

  @override
  State<WeightFormScreen> createState() => _WeightFormScreenState();
}

class _WeightFormScreenState extends State<WeightFormScreen> {
  final TextEditingController _weightController = TextEditingController();

  double _weight = 0;
  MailType? mailType;
  Location location = Location.local;
  Zones? zone;

  void _handleTypeChange(MailType? value) {
    setState(() {
      mailType = value;
    });
  }

  void _handleLocationChange(Location? value) {
    setState(() {
      if (value != null) {
        location = value;
      }
      zone = null; // Reset selected zone when location changes
    });
  }

  double get totalCost {
    double weight = _weight;
    double mailTypeCost = mailType?.cost ?? 0;
    double zoneCost = zone?.cost ?? 0;

    double totalCost = weight * mailTypeCost * zoneCost;

    return totalCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
              controller: _weightController,
              hint: "Weight",
              icon: Icons.monitor_weight_rounded,
              validation: (val) {
                if (val.isEmpty) {
                  return "Weight is required";
                }
                return null;
              },
              onChanged: (String? value) {
                if (value != null) {
                  double? weight = double.tryParse(value);
                  if (weight != null) {
                    setState(() {
                      _weight = weight;
                    });
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            const Text('Mail Type:'),
            Row(
              children: MailType.values.map((e) {
                return Expanded(
                  child: RadioListTile(
                    value: e,
                    title: Text(e.name),
                    groupValue: mailType,
                    onChanged: _handleTypeChange,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Location:'),
            Row(
              children: Location.values.map((l) {
                return Expanded(
                  child: RadioListTile(
                    value: l,
                    groupValue: location,
                    onChanged: _handleLocationChange,
                    title: Text(l.name),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Zone:'),
            DropdownButton<Zones>(
              value: zone,
              hint: const Text('Select Zone'),
              onChanged: (Zones? value) {
                setState(() {
                  zone = value;
                });
              },
              items: Zones.values
                  .where((e) => e.location == location)
                  .map<DropdownMenuItem<Zones>>((Zones value) {
                return DropdownMenuItem<Zones>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Calculate'),
            ),
            Text('Total Cost: $totalCost'),
          ],
        ),
      ),
    );
  }
}
