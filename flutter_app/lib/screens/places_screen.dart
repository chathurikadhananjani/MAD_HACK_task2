import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/travel_model.dart';
import 'package:flutter_app/providers/travel_data_provider.dart';
import 'package:provider/provider.dart';

class TravelPlaces extends StatefulWidget {
  @override
  _TravelPlacesState createState() => _TravelPlacesState();
}

class _TravelPlacesState extends State<TravelPlaces> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final mdl =Provider.of<TravelDataProvider>(context, listen: false);
    mdl.loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final mdl =Provider.of<TravelDataProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: mdl.travelList.length,
        itemBuilder: (context, index){
          TravelModel travel = mdl.travelList[index];
          return PlaceViewCard(
            title: travel.title,
            shortDetail:travel.shortDetail,
            image: travel.image,
            description: travel.description,
          );
        }
      )
    );
  }
}
class PlaceViewCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String shortDetail;

  PlaceViewCard({required this.description,required this.image,required this.title, required this.shortDetail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image),fit:BoxFit.cover)
            ),),
            SizedBox(height: 20,),
            Text(title,
              style:TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.blue),),
            SizedBox(height: 15,),
            Text(shortDetail,
              style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.cyan),),
            SizedBox(height: 10,),
            Text(description,
              style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueGrey),),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}

