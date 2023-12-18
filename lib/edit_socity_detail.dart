import 'package:association_table_guru/database_helper.dart';
import 'package:association_table_guru/main.dart';
import 'package:association_table_guru/optimized_socity_form_screen.dart';
import 'package:association_table_guru/socity_list_screen.dart';
import 'package:association_table_guru/socity_modal_screen.dart';
import 'package:flutter/material.dart';

class EditAssociationDetails extends StatefulWidget {
  const EditAssociationDetails({super.key});

  @override
  State<EditAssociationDetails> createState() => _EditAssociationDetailsState();
}

class _EditAssociationDetailsState extends State<EditAssociationDetails> {
  var _societyNameController = TextEditingController();
  var _dateOfIncorporationController = TextEditingController();
  var _panNumberController = TextEditingController();
  var _regnNoController = TextEditingController();
  var _aRegisterNoController = TextEditingController();
  var _gRegisterNoController = TextEditingController();
  var _registerOfficeController = TextEditingController();
  var _branchOfficeController = TextEditingController();
  bool firstTimeFlag = false;
  int _selectedId = 0;

  @override
  Widget build(BuildContext context) {
    if (firstTimeFlag == false) {
      print('------->once execute');
      firstTimeFlag = true;
      final associationDetial =
      ModalRoute
          .of(context)!
          .settings
          .arguments as AssociationDetailsModal;
      print('------->Received Data');
      print(associationDetial.id);
      print(associationDetial.societyName);
      print(associationDetial.dateOfIncorporation);
      print(associationDetial.panNumber);
      print(associationDetial.registeredNo);
      print(associationDetial.aRegisterNo);
      print(associationDetial.gRegisterNo);
      print(associationDetial.registerOffice);
      print(associationDetial.branchOffice);

      _selectedId = associationDetial.id!;
      _societyNameController.text = associationDetial.societyName;
      _dateOfIncorporationController.text =
          associationDetial.dateOfIncorporation;
      _panNumberController.text = associationDetial.panNumber;
      _regnNoController.text = associationDetial.registeredNo;
      _aRegisterNoController.text = associationDetial.aRegisterNo;
      _gRegisterNoController.text = associationDetial.gRegisterNo;
      _registerOfficeController.text = associationDetial.registerOffice;
      _branchOfficeController.text = associationDetial.branchOffice;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Association Detials Form'),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) =>
            [
              PopupMenuItem(value: 1, child: Text("Delete")),
            ],
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {
                print('--------> Delete option Clicked');
                _deleteFormDialog(context);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
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
                  print('------> Save Button clicked');
                  _save();
                },
                child: Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _deleteFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    print('-------> cancle button Clicked');
                    Navigator.pop(context);
                  },
                  child: const Text('Cancle')),
              ElevatedButton(
                  onPressed: () async {
                    print('------->Delete Button clicked');
                    _delete();
                  },
                  child: const Text('Delete'))
            ],
            title: const Text('Are you Sure You Want to delete This?'),
          );
        });
  }

  void _save() async {
    print('------->_update');
    print('------>Socity Name: ${_societyNameController.text}');
    print(
        '------->Data of Incroporation: ${_dateOfIncorporationController
            .text}');
    print('------->Pan Number: ${_panNumberController.text}');
    print('----->Regn No: ${_regnNoController.text}');
    print('---------->12a Register No: ${_aRegisterNoController.text}');
    print('---------->80g Register No: ${_gRegisterNoController.text} ');
    print('------->Register Office : ${_registerOfficeController.text}');
    print('------>Branch Office :${_branchOfficeController.text} ');
    Map<String, dynamic> row = {
      Databasehelper.colSocietyName: _societyNameController.text,
      Databasehelper.colDataOfIncorporation:
      _dateOfIncorporationController.text,
      Databasehelper.colPanNumber: _panNumberController.text,
      Databasehelper.colaRegistrationNo: _aRegisterNoController.text,
      Databasehelper.colgRegistrationNo: _gRegisterNoController.text,
      Databasehelper.colRegisteredOffice: _registerOfficeController.text,
      Databasehelper.colBranchOffice: _branchOfficeController.text,
    };
    final result = await dbHelper.UpdateAssociationDetials(
        row, Databasehelper.associationDetialsTable);
    debugPrint('----------------->Updated Row Id:$result');
    if (result > 0) {
      Navigator.pop(context);
      _showSuccessSnackBar(context, 'Update');
    }
    setState(() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AssociationListScreen()));
    });
  }
  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(message)));
  }

  void _delete() async {
    print('--------------> _delete');

    final result = await dbHelper.deleteAssociationDetials(
        _selectedId, Databasehelper.associationDetialsTable);

    debugPrint('-----------------> Deleted Row Id: $result');

    if (result > 0) {
      _showSuccessSnackBar(context, 'Deleted.');
      Navigator.pop(context);
    }
    setState(() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OptimizedAssociationFormScreen()));
    });
  }
}

