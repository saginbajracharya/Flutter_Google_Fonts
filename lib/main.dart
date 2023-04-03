import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Fonts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Google Fonts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List allFontsList = GoogleFonts.asMap().keys.toList();
  TextEditingController fontController = TextEditingController();
  dynamic selectedFontWeight = FontWeight.normal;
  double selectedFontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            controller: fontController,
            keyboardType: TextInputType.number,
            onChanged: (newValue){
              setState(() {
                selectedFontSize = double.parse(newValue);
              });
            }
          ),
          Row(
            children: [
              TextButton(
                onPressed: (){
                  setState(() {
                    selectedFontWeight = FontWeight.bold;
                  });
                }, 
                child: const Text('Bold'),
              ),
              TextButton(
                onPressed: (){
                  setState(() {
                    selectedFontWeight = FontWeight.normal;
                  });
                }, 
                child: const Text('Normal'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder( 
              shrinkWrap: true,
              padding: const EdgeInsets.only(top:20,bottom: 20,left:10,right: 10),
              itemCount: GoogleFonts.asMap().keys.toList().length,
              itemBuilder: (ctx,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text((index+1).toString()),
                      Flexible(
                        child: Tooltip(
                          message: '${allFontsList[index]}',
                          child: Text(
                            '${allFontsList[index]}',
                            style: GoogleFonts.getFont(
                              allFontsList[index],
                              fontSize: selectedFontSize,
                              fontWeight: selectedFontWeight
                            ),
                          ),
                        ),
                      ),
                      const SizedBox()
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
