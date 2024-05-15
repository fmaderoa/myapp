
import 'package:flutter/material.dart';

class Capture extends StatefulWidget {
  const Capture({Key? key}) : super(key: key);

  @override
  State<Capture> createState() => _CaptureState();
}

class _CaptureState extends State<Capture> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _clientCodeController = TextEditingController();
  final _acvController = TextEditingController();
  final _yearsController = TextEditingController();
  final _tcvController = TextEditingController();
  final _marginController = TextEditingController();

  // Dropdowns
  String? _businessUnit;
  String? _stage;
  String? _type;
  String? _region;
  String? _territory;
  String? _industry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Client code text field
              TextFormField(
                controller: _clientCodeController,
                decoration: const InputDecoration(
                  labelText: 'Client Code',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a client code';
                  }
                  return null;
                },
              ),

              // Business unit dropdown
              DropdownButtonFormField<String>(
                value: _businessUnit,
                items: const [
                  DropdownMenuItem(
                    value: 'Unit 1',
                    child: Text('Unit 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Unit 2',
                    child: Text('Unit 2'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _businessUnit = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a business unit';
                  }
                  return null;
                },
              ),

              // Stage dropdown
              DropdownButtonFormField<String>(
                value: _stage,
                items: const [
                  DropdownMenuItem(
                    value: 'Stage 1',
                    child: Text('Stage 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Stage 2',
                    child: Text('Stage 2'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _stage = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a stage';
                  }
                  return null;
                },
              ),

              // Type dropdown
              DropdownButtonFormField<String>(
                value: _type,
                items: const [
                  DropdownMenuItem(
                    value: 'Type 1',
                    child: Text('Type 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Type 2',
                    child: Text('Type 2'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _type = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a type';
                  }
                  return null;
                },
              ),

              // ACV text field
              TextFormField(
                controller: _acvController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'ACV',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ACV';
                  }
                  return null;
                },
              ),

              // Years text field
              TextFormField(
                controller: _yearsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Years',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of years';
                  }
                  return null;
                },
              ),

              // TCV text field
              TextFormField(
                controller: _tcvController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'TCV',    
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a TCV';
                  }
                  return null;
                },
              ),

              // Margin text field
              TextFormField(
                controller: _marginController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Margin',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a margin';
                  }
                  return null;
                },
              ),

              // Region dropdown
              DropdownButtonFormField<String>(
                value: _region,
                items: const [
                  DropdownMenuItem(
                    value: 'Region 1',
                    child: Text('Region 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Region 2',
                    child: Text('Region 2'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _region = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a region';
                  }
                  return null;
                },
              ),

              // Territory dropdown
              DropdownButtonFormField<String>(
                value: _territory,
                items: const [
                  DropdownMenuItem(
                    value: 'Territory 1',
                    child: Text('Territory 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Territory 2',
                    child: Text('Territory 2'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _territory = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a territory';
                  }
                  return null;
                },
              ),

              // Industry dropdown
              DropdownButtonFormField<String>(
                value: _industry,
                items: const [
                  DropdownMenuItem(
                    value: 'Industry 1',
                    child: Text('Industry 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Industry 2',
                    child: Text('Industry 2'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _industry = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an industry';
                  }
                  return null;
                },
              ),

              // Submit button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the form data
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

