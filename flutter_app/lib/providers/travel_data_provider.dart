import 'package:flutter/material.dart';
import 'package:flutter_app/models/travel_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TravelDataProvider with ChangeNotifier{
  List<TravelModel> travelList =[];
  loadPlaces(){
    FirebaseFirestore.instance.collection('attraction').get().then((querySnapshot){
      querySnapshot.docs.forEach((queryDocSnapshot){
        if(queryDocSnapshot.exists){
          travelList.add(TravelModel.fromJson(queryDocSnapshot.data()));
        }
      });
      notifyListeners();
    });
  }
}