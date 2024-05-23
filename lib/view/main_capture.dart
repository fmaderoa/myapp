
import 'package:flutter/material.dart';
import 'package:myapp/data/savedata.dart';
import 'package:myapp/model/commercial_opportunity.dart';
import 'package:myapp/view/dropdowncustom.dart';
import 'package:myapp/view/estilotitulo.dart';

class Capture extends StatefulWidget {
  const Capture({super.key});

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
  String? _type;
  String? _region;
  String? _territory;
  String? _industry;
  String? _idsealer;

  String _lastOpportunityNumber = '';

  @override
  void initState() {
    super.initState();
    _getLastOpportunityNumber();
  }

// Function to save Commercial Opportunity
Future<void> saveCommercialOpportunity() async {
  // Validate the form
  
    // Get the form data
    String clientCode = _clientCodeController.text;
    String acv = _acvController.text;
    String years = _yearsController.text;
    String tcv = _tcvController.text;
    String margin = _marginController.text;
    // Create a CommercialOpportunity object
    CommercialOpportunity opportunity = CommercialOpportunity(
      numeroOperacion: "OP-13791",
      cliente: clientCode,
      unidadNegocio: "CL-00509",
      etapa: "S1",
      tipo: "TY-05",
      acv: 116683.82,
      tcv: 116683.82,
      margenGanancia: 0.22,
      region: "RE-02",
      territorio: "TE-01",
      industria: "IN-41",
      fechaCreacion: "2023-04-26",
      fechaCierre: "2023-07-06",
      edadOferta: 71.0,
      fuentePrincipal: "LS-15",
      numeroVendedor: "NV-1",
    );

    // Save the opportunity using the DataSave class
    final dataSave = DataSave();
    await dataSave.saveInfo(opportunity);

    // Show a success message
    print("Funciono correctamente");
  
}


Future<String> _getLastOpportunityNumber() async {
  final dataSave = DataSave();  
  final data = await dataSave.getLastOpportunity();
  return data;
}




  List<String> opcionesUnidadNegocio=[
    'BU-01',
    'BU-02',
    'BU-03',
    'BU-04',
    'BU-05',
    'BU-06',
    'BU-07',
    'BU-08',
    'BU-09',
    'BU-10',
  ];
  
  List<String> tipos=[
    'TY-00',
    'TY-01',
    'TY-02',
    'TY-03',
    'TY-04',
    'TY-05',    
  ];

  List<String> regiones=[
    'RE-00',
    'RE-01',
    'RE-02',
    'RE-03',    
  ];

  List<String> territorios=[
    'TE-00',
    'TE-01',
    'TE-02',
    'TE-03',    
    'TE-04',
    'TE-05',
    'TE-06',
    'TE-07',
    'TE-08',    
  ];

  List<String> industrias=[
    'IN-00',
    'IN-01',
    'IN-02',
    'IN-03',    
    'IN-04',
    'IN-05',
    'IN-06',
    'IN-07',
    'IN-08',    
    'IN-09',
    'IN-10',
  ];

  List<String> vendedores=[
    'NV-0',
    'NV-1',
    'NV-2',
    'NV-3',    
    'NV-4',    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TABD'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const EstiloTitulo(textoTitulo: 'Ingrese los datos'),      
                const SizedBox(height: 30,),
                // Client code text field
                TextFormField(
                  controller: _clientCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Código de cliente',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un código';
                    }
                    return null;
                  },
                ),
                // Business unit dropdown
                DropDownCustom(
                  listaDeOpciones: opcionesUnidadNegocio, 
                  nombreColeccion: 'Unidad de negocio', 
                  onSelectedValue: (value) {                          
                           _businessUnit = value;                           
                           setState(() {
                             
                           });
            
                          }, selectElement: _businessUnit,),
                //DropDownCustom tipos
                DropDownCustom(
                  listaDeOpciones: tipos, 
                  nombreColeccion: 'Tipo', 
                  onSelectedValue: (value) {                          
                           _type = value;                           
                           setState(() {
                             
                           });
            
                          }, selectElement: _type,),
                //DropDownCustom regiones
                DropDownCustom(
                  listaDeOpciones: regiones, 
                  nombreColeccion: 'Región', 
                  onSelectedValue: (value) {                          
                           _region = value;                           
                           setState(() {
                             
                           });
            
                          }, selectElement: _region,),
                //DropDownCustom territorios
                DropDownCustom(
                  listaDeOpciones: territorios, 
                  nombreColeccion: 'Territorio', 
                  onSelectedValue: (value) {                          
                           _territory = value;                           
                           setState(() {
                             
                           });
            
                          }, selectElement: _territory),

                //DropDownCustom industrias
                DropDownCustom(
                  listaDeOpciones: industrias, 
                  nombreColeccion: 'Industria', 
                  onSelectedValue: (value) {                          
                           _industry = value;                           
                           setState(() {
                             
                           });
            
                          }, selectElement: _industry),
                //DropDownCustom vendedores
                DropDownCustom(
                  listaDeOpciones: vendedores, 
                  nombreColeccion: 'Vendedor', 
                  onSelectedValue: (value) {                          
                           _idsealer = value;                           
                           setState(() {
                             
                           });
            
                          }, selectElement: _idsealer),

                
        
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
                    labelText: 'Años',
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
                    labelText: 'Margen',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a margin';
                    }
                    return null;
                  },
                ),
        
                const SizedBox(height: 20,),
                // Submit button
                ElevatedButton(
                  onPressed: () async {
                    print('presiono boton');
                    saveCommercialOpportunity();
                    if (_formKey.currentState!.validate()) {
                      // Process the form data
                      String clientCode = _clientCodeController.text;
                      String acv = _acvController.text;
                      String years = _yearsController.text;
                      String tcv = _tcvController.text;
                      String margin = _marginController.text;

                      _lastOpportunityNumber = await _getLastOpportunityNumber();                      
                      print(_lastOpportunityNumber);
                      print('Client Code: $clientCode');
                      print('ACV: $acv');
                      print('Years: $years');
                      print('TCV: $tcv');
                      print('Margin: $margin');
                    }
                  },
                  child: const Text('Guardar Datos'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

