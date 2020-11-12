import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:thredzit/adminPanel/adminBloc.dart';
import 'package:thredzit/application.dart';

class ListOfOrders extends StatefulWidget {
  @override
  _ListOfOrdersState createState() => _ListOfOrdersState();
}

class _ListOfOrdersState extends State<ListOfOrders> {
  AdminBloc _bloc = AdminBloc.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginateFirestore(
        emptyDisplay: Center(
          child: Text('No records found'),
        ),
        itemsPerPage: 10,

        itemBuilderType: PaginateBuilderType.listView,

        itemBuilder: (index, context, documentSnapshot) => getEachItemCard(
          Application.fromJson(documentSnapshot.data()),
        ),

        // orderBy is compulsory to enable pagination
        query: _bloc.getOrdersList(),
      ),
    );
  }

  Widget getEachItemCard(Application application) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: ExpansionTile(
              backgroundColor: Colors.white38,
              subtitle: getSubtitle(application),
              tilePadding: EdgeInsets.all(8.0),
              children: getChildren(application),
              title: getTitle(application))),
    );
  }

  Widget getTitle(Application application) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SelectableText(
        application.name,
        // overflow: TextOverflow.ellipsis,
      ),
    );
  }

  List<Widget> getChildren(Application application) {
    return [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getLeftWidgetInExpandedTile(application),
            // Container(child: VerticalDivider(color: Colors.red)),
            SizedBox(
              width: 20,
            ),
            getRightWidgetInExpandedTile(application),
          ],
        ),
      ),
    ];
  }

  Widget getRightWidgetInExpandedTile(Application application) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getRow('Occupation : ', application.occupation.toString()),
        getRow('Age : ', application.age.toString()),
        getRow('House Number : ', application.houseNumber),
        getRow('Street : ', application.street),
        getRow('Town : ', application.town),
        getRow('District : ', application.district),
        getRow('Post Office : ', application.postOffice.toString()),
        getRow('Police station : ', application.policeStation),
      ],
    );
  }

  Widget getLeftWidgetInExpandedTile(Application application) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getRow(
          'Qualification : ',
          application.qualification.toString(),
        ),
        getRow(
          'Graduation college : ',
          application.graduationCollege.toString(),
        ),
        getRow(
          'Graduation Year : ',
          application.graduationYear.toString(),
        ),
        getRow(
          'AadharCard No: ',
          application.aadhaarNumber,
        ),
        getRow(
          'Mobile No : ',
          application.primaryMobileNumber.toString(),
        ),
        getRow('Alternate Mobile No : ',
            application.alternateMobileNumber.toString()),
        getRow(
          'email : ',
          application.emailId.toString(),
        ),
      ],
    );
  }

  Widget getSubtitle(Application application) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getRowInTitle(
            'Registered on : ',
            DateFormat.yMMMd()
                .add_jms()
                .format(application.registeredOn.toDate())
                .toString()),
        getRowInTitle(
            'Application No : ', application.applicationID.toString()),
      ],
    );
  }

  Widget getRow(String s, String t) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            child: Text(
              s,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            child: SelectableText(
              t,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget getRowInTitle(String s, String t) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: Container(
              child: SelectableText(
                s,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: SelectableText(
                t,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
