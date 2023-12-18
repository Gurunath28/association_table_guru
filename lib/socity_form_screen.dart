import 'package:association_table_guru/database_helper.dart';
import 'package:association_table_guru/main.dart';
import 'package:association_table_guru/socity_list_screen.dart';
import 'package:flutter/material.dart';

class AssociationFormScreen extends StatefulWidget {
  const AssociationFormScreen({super.key});

  @override
  State<AssociationFormScreen> createState() => _AssociationFormScreenState();
}

class _AssociationFormScreenState extends State<AssociationFormScreen> {
  var _societyNameController = TextEditingController();
  var _dateOfIncorporationController = TextEditingController();
  var _panNumberController = TextEditingController();
  var _regnNoController = TextEditingController();
  var _aRegisterNoController = TextEditingController();
  var _gRegisterNoController = TextEditingController();
  var _registerOfficeController = TextEditingController();
  var _branchOfficeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Association Detials Form'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _societyNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: 'Socity Name',
                    hintText: 'Enter Socity Name',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _dateOfIncorporationController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Date of Incroporation',
                    hintText: 'Enter Date of Incroporation',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _panNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Pan Number',
                    hintText: 'Enter Pan Number',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _regnNoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Register No',
                    hintText: 'Enter Register No',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _aRegisterNoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: '12a Register No',
                    hintText: 'Enter 12a Register No',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _gRegisterNoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: '80g Register No',
                    hintText: 'Enter 80g Register No',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _registerOfficeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Register Office',
                    hintText: 'Enter Register Office',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _branchOfficeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Branch Office',
                    hintText: 'Enter Branch Office',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('------> Save button clicked');
                    _save();
                  },
                  child: Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() async {
    print('---------> _save');
    print('------>Socity Name: ${_societyNameController.text}');
    print('------->Data of Incroporation: ${_dateOfIncorporationController.text}');
    print('------->Pan Number: ${_panNumberController.text}');
    print('----->Regn No: ${_regnNoController.text}');
    print('---------->12a Register No: ${_aRegisterNoController.text}');
    print('---------->80g Register No: ${_gRegisterNoController.text} ');
    print('------->Register Office : ${_registerOfficeController.text}');
    print('------>Branch Office :${_branchOfficeController.text} ');

    Map<String, dynamic> row = {
      Databasehelper.colSocietyName: _societyNameController.text,
      Databasehelper.colDataOfIncorporation: _dateOfIncorporationController.text,
      Databasehelper.colPanNumber: _panNumberController.text,
      Databasehelper.colRegnNo : _regnNoController.text,
      Databasehelper.colaRegistrationNo: _aRegisterNoController.text,
      Databasehelper.colgRegistrationNo: _gRegisterNoController.text,
      Databasehelper.colRegisteredOffice: _registerOfficeController.text,
      Databasehelper.colBranchOffice: _branchOfficeController.text,
    };
    final result = await dbHelper.insertAssociationDetials(
        row, Databasehelper.associationDetialsTable);
    debugPrint('------------> Inserted Row Id: $result');
    if (result > 0) {
      Navigator.of(context);
      _showSucceccSnakBar(context, 'Saved');
    }
    setState(() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AssociationListScreen()));
    });
  }

  void _showSucceccSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(message)));
  }
//  void _delete() async{
  //  print('-------> _delete');
  //final result = await dbHelper.deleteAssociatio
  //}
}
