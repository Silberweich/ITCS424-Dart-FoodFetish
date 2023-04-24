import 'package:flutter/material.dart';

const kNormalTitleTextStyle = TextStyle(
  color: Color(0x99000000),
  fontWeight: FontWeight.bold,
  fontSize: 17.0,
);

const kTinyTitleTextStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.orange,
  fontWeight: FontWeight.bold,
);

class RecipeDetails extends StatelessWidget {
  final String title;
  final List<String> listTitle;
  final List<String> sub;
  final List<String> trail;

  const RecipeDetails({super.key, 
    required this.title,
    required this.listTitle,
    required this.sub,
    required this.trail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 5.0,
            bottom: 15.0,
          ),
          child: Text(
            title,
            style: kNormalTitleTextStyle,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0x33FF5C4D),
          ),
          margin: const EdgeInsets.only(
            bottom: 15.0,
          ),
          padding: const EdgeInsets.only(
            top: 5.0,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      bottom: listTitle.length - 1 == index ? 5.0 : 0.0,
                      left: 20.0,
                      right: 15.0,
                    ),
                    leading: title == 'Ingredients'
                        ? const CircleAvatar(
                            radius: 10.0,
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            child: Icon(
                              Icons.check,
                              size: 10.0,
                            ),
                          )
                        : const CircleAvatar(
                            radius: 10.0,
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            child: Icon(
                              Icons.adjust,
                              size: 10.0,
                            ),
                          ),
                    title: Text(
                      listTitle[index],
                      style: const TextStyle(
                        color: Color(0xBB000000),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      sub[index],
                      style: const TextStyle(
                        color: Color.fromARGB(185, 24, 24, 24),
                      ),
                    ),
                    trailing: Text(
                      trail[index],
                      style: const TextStyle(
                        color: Color.fromARGB(185, 24, 24, 24),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              );
            },
            itemCount: listTitle.length,
          ),
        ),
      ],
    );
  }
}
