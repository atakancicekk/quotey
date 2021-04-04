import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotey/network/api_handler.dart';

class Quotey extends StatefulWidget {
  @override
  _QuoteyState createState() => _QuoteyState();
}

class _QuoteyState extends State<Quotey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.blue, Colors.white],
          ),
        ),
        child: FutureBuilder(
          future: Network().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String quote = snapshot.data.content;
              String author = snapshot.data.author;
              return Container(
                margin: EdgeInsets.only(top: 300.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "\"" + quote + "\"",
                            style: GoogleFonts.montserrat(
                              fontSize: 25.0,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Text(
                            "-" + author,
                            style: GoogleFonts.montserrat(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200.0),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            setState(() {
                              Network().fetchData();
                            });
                          },
                          child: Text(
                            'Inspire Me !',
                            style: GoogleFonts.montserrat(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.black, Colors.blue, Colors.white],
                ),
              ),
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
