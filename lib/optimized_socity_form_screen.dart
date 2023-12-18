import 'package:association_table_guru/database_helper.dart';
import 'package:association_table_guru/main.dart';
import 'package:association_table_guru/socity_list_screen.dart';
import 'package:association_table_guru/socity_modal_screen.dart';
import 'package:flutter/material.dart';

class OptimizedAssociationFormScreen extends StatefulWidget {
  const OptimizedAssociationFormScreen({super.key});

  @override
  State<OptimizedAssociationFormScreen> createState() =>
      _OptimizedAssociationFormScreenState();
}

class _OptimizedAssociationFormScreenState
    extends State<OptimizedAssociationFormScreen> {
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

  String buttonText = 'Save';

  @override
  Widget build(BuildContext context) {
    if (firstTimeFlag == false) {
      print('------->Once Execute');

      firstTimeFlag = true;

      final associationDetial = ModalRoute.of(context)!.settings.arguments;
      if (associationDetial == null) {
        print('----------> FAB: Insert/Save:');
      } else {
        print('-------->ListView: Received Data: Edit/Delete');
        associationDetial as AssociationDetailsModal;
        print('-------->Received Data');

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
        buttonText = 'Update';

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
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Association Details Form'),
        actions: _selectedId == 0
            ? null
            : [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 1, child: Text('Delete')),
                  ],
                  elevation: 2,
                  onSelected: (value) {
                    if (value == 1) {
                      _deleteFormDialog(context);
                    }
                  },
                )
              ],
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: [
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
              print('----------->Button Clicked');
              if (_selectedId==0) {
                print('---------->Save');
                _save();
              } else {
                print('---------->Update');
                _update();
              }
            },
            child: Text(buttonText),
          )
        ])),
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
                  print('--------->Cancle Button Clicked');
                  Navigator.pop(context);
                },
                child: Text('Cancle'),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('------>Delete Button Clicked');
                    _delete();
                  },
                  child: Text('Delete'))
            ],
            title: Text('Are You Sure You Want To Delete this?'),
          );
        });
  }

  void _save() async {
    print('----------> _save');
    print('------>Socity Name: ${_societyNameController.text}');
    print(
        '------->Data of Incroporation: ${_dateOfIncorporationController.text}');
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
      Databasehelper.colRegnNo: _regnNoController.text,
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

  void _update() async {
    print('------>Update');
    print('------>Socity Name: ${_societyNameController.text}');
    print('------->Data of Incroporation: ${_dateOfIncorporationController.text}');
    print('------->Pan Number: ${_panNumberController.text}');
    print('----->Regn No: ${_regnNoController.text}');
    print('---------->12a Register No: ${_aRegisterNoController.text}');
    print('---------->80g Register No: ${_gRegisterNoController.text} ');
    print('------->Register Office : ${_registerOfficeController.text}');
    print('------>Branch Office :${_branchOfficeController.text} ');

    Map<String, dynamic> row = {
      Databasehelper.colId: _selectedId,
      Databasehelper.colSocietyName: _societyNameController.text,
      Databasehelper.colDataOfIncorporation:
          _dateOfIncorporationController.text,
      Databasehelper.colPanNumber: _panNumberController.text,
      Databasehelper.colRegnNo: _regnNoController.text,
      Databasehelper.colaRegistrationNo: _aRegisterNoController.text,
      Databasehelper.colgRegistrationNo: _gRegisterNoController.text,
      Databasehelper.colRegisteredOffice: _registerOfficeController.text,
      Databasehelper.colBranchOffice: _branchOfficeController.text,
    };
    final result = await dbHelper.UpdateAssociationDetials(
        row, Databasehelper.associationDetialsTable);
    debugPrint('------->Update Row Id: $result');
    if (result > 0) {
      Navigator.pop(context);
      _showSucceccSnakBar(context, 'Updated');
    }
    setState(() {
      Navigator.of(context).pushReplacement(    sociationListScreen()));
    });
  }

  void _showSucceccSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(message)));
  }

  void _delete() async {
    print('-------->_delete');
    final result = await dbHelper.deleteAssociationDetials(
        _selectedId,Databasehelper.associationDetialsTable);
    debugPrint('------->Deleted Row Id:$result');
    if (result > 0) {
      _showSucceccSnakBar(context, 'Deleted');
      Navigator.pop(context);

    }
    setState(() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AssociationListScreen()));
    });
  }
}
