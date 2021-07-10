import 'package:flutter/material.dart';
import 'package:flutter_app/providers/travel_data_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Travel());
}
class Travel extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: providers,
      child:MaterialApp(
        title: "Travel App",
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.black45)
        ),
      ),
    );
  }
}
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<TravelDataProvider>(create: (_)=>TravelDataProvider())
];


