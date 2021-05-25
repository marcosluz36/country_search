import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountryCard extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryCard({
    this.country,
    Key key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff1f2f6),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3.0,
          )
        ]
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              color: Color(0xff7c94b6),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(country["flag"]),
                fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                )
              ]
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                text: TextSpan(
                  text: "Nome: ",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff515151),
                  ),
                  children: [
                    TextSpan(
                      text: country["name"],
                      style: TextStyle(
                        color: Color(0xff383838),
                        fontWeight: FontWeight.w800
                      )
                    )
                  ]
                ),
              ),
              SizedBox(height: 5.0),
              RichText(
                text: TextSpan(
                  text: "Região: ",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff515151),
                  ),
                  children: [
                    TextSpan(
                      text: country["region"],
                      style: TextStyle(
                        color: Color(0xff383838),
                        fontWeight: FontWeight.w800
                      )
                    )
                  ]
                ),
              )
            ],
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Sigla: ",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff515151),
                  ),
                  children: [
                    TextSpan(
                      text: country["initials"],
                      style: TextStyle(
                        color: Color(0xff383838),
                        fontWeight: FontWeight.w800
                      )
                    )
                  ]
                ),
              ),
              SizedBox(height: 5.0),
              RichText(
                text: TextSpan(
                  text: "Moeda: ",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff515151),
                  ),
                  children: [
                    TextSpan(
                      text: country["currency"],
                      style: TextStyle(
                        color: Color(0xff383838),
                        fontWeight: FontWeight.w800
                      )
                    )
                  ]
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
