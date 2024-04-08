import 'package:flutter/material.dart';
import '../../commons/constants/app_color.dart';
import '../commons/widgets/text_field_widget.dart';


class WeightFormScreen extends StatefulWidget {
  @override
  _WeightFormScreenState createState() => _WeightFormScreenState();
}

class _WeightFormScreenState extends State<WeightFormScreen> {
  int? _weight;
  int _selectedType = 1;
  bool _isLocal = true;
  String? _selectedZone;
  int? totalCost;
  int? localRate;
  int? internationalRate;

  final TextEditingController _weightController = TextEditingController();


  void _handleTypeChange(int? value) {
    setState(() {
      _selectedType = value ?? 1;
    });
  }

  void _handleLocationChange(bool? value) {
    setState(() {
      _isLocal = value ?? true;
      _selectedZone = null; // Reset selected zone when location changes
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Weight Service',style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MyTextField(
              //   controller: _weightController,
              //   hint: "Weight",
              //   icon: Icons.monitor_weight_rounded,
              //   validation: (val) {
              //     if (val.isEmpty) {
              //       return "Weight is required";
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 20),
              TextField(
                style: TextStyle(
                    color: Colors.black
                ),
                decoration: InputDecoration(

                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.backgroundColorDark),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.backgroundColorDark),
                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.secondary2),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Mail Weight (in kgs)',
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),

                ),
                // decoration: InputDecoration(
                //   labelText: 'Weight',
                // ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // setState(() {
                  //   weight = double.parse(value);
                  // });
                },
              ),
              const SizedBox(height: 20),
              const Text('Mail Type:',style: TextStyle(color: Colors.black),),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedType,
                    onChanged: _handleTypeChange,
                  ),
                  const Text('Type 1',style: TextStyle(color: Colors.black),),
                  Radio(
                    value: 2,
                    groupValue: _selectedType,
                    onChanged: _handleTypeChange,
                  ),
                  const Text('Type 2',style: TextStyle(color: Colors.black),),
                  Radio(
                    value: 3,
                    groupValue: _selectedType,
                    onChanged: _handleTypeChange,
                  ),
                  const Text('Type 3',style: TextStyle(color: Colors.black),),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Location:',style: TextStyle(color: Colors.black),),
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: _isLocal,
                    onChanged: _handleLocationChange,
                  ),
                  const Text('Local',style: TextStyle(color: Colors.black),),
                  Radio(
                    value: false,
                    groupValue: _isLocal,
                    onChanged: _handleLocationChange,
                  ),
                  const Text('International',style: TextStyle(color: Colors.black),),
                ],
              ),
              const SizedBox(height: 20),
              if (_isLocal) ...[
                const Text('Zone:',style: TextStyle(color: Colors.black),),
                DropdownButton<String>(
                  value: _selectedZone,
                  hint: const Text('Select Zone',style: TextStyle(color: Colors.black),),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedZone = value;
                    });
                  },
                  items: <String>['Zone 1', 'Zone 2', 'Zone 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                ),
              ] else ...[
                const Text('Zone:',style: TextStyle(color: Colors.black),),
                DropdownButton<String>(
                  value: _selectedZone,
                  hint: const Text('Select Zone',style: TextStyle(color: Colors.black),),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedZone = value;
                    });
                  },
                  items: <String>['Zone A', 'Zone B', 'Zone C', 'Zone D']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => NewScreen(data: _weightController.text),
                    //   ),
                    // );
                    //todo: Implement your calculation logic here
                    if (_weight != null && _selectedZone != null) {
                      print('Weight:${_weightController.text}kg');
                      print('Mail Type: $_selectedType');
                      print('Location: ${_isLocal ? 'Local' : 'International'}');
                      print('Zone: $_selectedZone');
                      // Perform calculations or other actions based on inputs
                    } else {
                      print('Please fill out all fields.');
                    }
                  },
                  child: const Text('Calculate',style: TextStyle(fontSize: 20,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondary2),
                ),
              ),
              const SizedBox(height: 50),
              Center(child: Text('Total Cost: $totalCost',style: TextStyle(fontSize: 20,color: Colors.black),)),
            ],
          ),
        ),
      ),
    );
  }
}


