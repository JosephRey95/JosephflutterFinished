import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_project/Models/model_newsApi.dart';

class Preview extends StatefulWidget {

  Articles arguments;

  Preview(this.arguments);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {

  @override
  Widget build(BuildContext context) {

   dynamic HeightPX = MediaQuery.of(context).size.height;
   dynamic WidthPX = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: WidthPX,
        height: HeightPX,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 40,
                  left: 25,
                  right: 25
              ),
              height: HeightPX/2.5,
              width: WidthPX,
              decoration: BoxDecoration(
                  image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.arguments.UrlToImage != null ?  NetworkImage(widget.arguments.UrlToImage) : AssetImage('assets/img/backbit.png')),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        spreadRadius: 9,
                        blurRadius: 12
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(widget.arguments.Title ?? 'Title not find',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal
                      )),

                  Container(
                    height: HeightPX/40,
                  ),

                  Text(widget.arguments.Content ?? 'Content not find',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.fade,
                      maxLines: 4,
                      style: GoogleFonts.signika(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal
                      ))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
