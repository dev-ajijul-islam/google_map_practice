import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_map_practice/app.dart';

void  main()async{
  await dotenv.load(fileName: ".env");
  runApp(GoogleMap());
}