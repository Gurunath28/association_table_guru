import 'package:association_table_guru/database_helper.dart';
import 'package:association_table_guru/edit_socity_detail.dart';
import 'package:association_table_guru/main.dart';
import 'package:association_table_guru/optimized_socity_form_screen.dart';
import 'package:association_table_guru/socity_form_screen.dart';
import 'package:association_table_guru/socity_modal_screen.dart';
import 'package:flutter/material.dart';

class AssociationListScreen extends StatefulWidget {
  const AssociationListScreen({super.key});

  @override
  State<AssociationListScreen> createState() => _AssociationListScreenState();
}

class _AssociationListScreenState extends State<AssociationListScreen> {
  late List<AssociationDetailsModal> _associationDetailsList;

  @override
  void initState() {
    super.initState();
    getAllAssociationDetils();
  }

  getAllAssociationDetils() async {
    _associationDetailsList = <AssociationDetailsModal>[];
    var associationDetailRecords =
        await dbHelper.queryAllRows(Databasehelper.associationDetialsTable);
    associationDetailRecords.forEach((associationDetails) {
      setState( () {

        print(associationDetails['_id']);
        print(associationDetails['_societyName']);
        print(associationDetails['_dateOfIncorporation']);
        print(associationDetails['_panNumber']);
        print(associationDetails['_registeredNo']);
        print(associationDetails['_aRegistrationNo']);
        print(associationDetails['_gRegistrationNo']);
        print(associationDetails['_registeredOffice']);
        print(associationDetails['_branchOffice']);

        var associationDetailsModal = AssociationDetailsModal(
            associationDetails['_id'],
            associationDetails['_societyName'],
            associationDetails['_dateOfIncorporation'],
            associationDetails['_panNumber'],
            associationDetails['_registeredNo'],
            associationDetails['_aRegistrationNo'],
            associationDetails['_gRegistrationNo'],
            associationDetails['_registeredOffice'],
            associationDetails['_branchOffice']);

        _associationDetailsList.add(associationDetailsModal);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Association Detials',
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: _associationDetailsList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    print('-------->Edit or Delete invoked: Send Data');
                    print(_associationDetailsList[index].id);
                    print(_associationDetailsList[index].societyName);
                    print(_associationDetailsList[index].panNumber);
                    print(_associationDetailsList[index].registeredNo);
                    print(_associationDetailsList[index].aRegisterNo);
                    print(_associationDetailsList[index].gRegisterNo);
                    print(_associationDetailsList[index].registerOffice);
                    print(_associationDetailsList[index].branchOffice);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditAssociationDetails(),
                        settings: RouteSettings(
                          arguments: _associationDetailsList[index],
                        )));
                  },
                  child: ListTile(
                    title: Text(_associationDetailsList[index].societyName),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('----------->Launch Association list on Screen');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>OptimizedAssociationFormScreen()));

      },
        child: Icon(Icons.add),
      ),
    );
  }
}
