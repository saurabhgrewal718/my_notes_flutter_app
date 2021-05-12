import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_notes_app/pages/components/new_idea.dart';
import 'package:my_notes_app/pages/idea.dart';
import 'package:my_notes_app/pages/term.dart';

import '../assets.dart';
import '../constants.dart';
import '../models/newpet.dart';
import '../models/petselection.dart';
import './petdetail.dart';
import '../size_config.dart';
import '../themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const routeName = './home';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            New_Idea(),
            // _firebaseList(),
            // _petSelection(),
            _newPet(),
          ],
        ),
      ),
    );
  }

  _newPet() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:  Expanded(
              child: Container(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: petList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PetTile(pet: petList[index]);
                  },
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
              ),
            ),
      ),
    );
  }    


  _newwPet() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          child: Text("Press me"),
          onPressed: (){
            FirebaseFirestore.instance.collection('idea/mbntuJJdPYJqLgpsKRdI/messages/').add({
              'idea':'this is a new idea sirjee!'
            });
          },
        ) 
      ),
    );
  }   


// _firebaseList(){
//   return Container(
//     margin: EdgeInsets.only(top:10),
//     height:80,
//     width: SizeConfig.screenWidth,
//     child: StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('idea/mbntuJJdPYJqLgpsKRdI/messages/')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return Center(child: CircularProgressIndicator(),);
//         }
//         final documents = snapshot.data.docs; 
//         return ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: documents.length,
//           itemBuilder: (context, index) {
//             return _petTile(documents[index]['idea'],documents[index]['img'],documents[index]['selected']);
//           },
//         );
//       }
//     ),
//   );
// } 


// _firebaseList(){
//   return Container(
//     margin: EdgeInsets.only(top:10),
//     height:80,
//     width: SizeConfig.screenWidth,
//     child: StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('idea/mbntuJJdPYJqLgpsKRdI/messages/')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return Center(child: CircularProgressIndicator(),);
//         }
//         final documents = snapshot.data.docs; 
//         return ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: documents.length,
//           itemBuilder: (context, index) {
//             return _petTile(documents[index]['idea'],documents[index]['img'],documents[index]['selected']);
//           },
//         );
//       }
//     ),
//   );
// } 



  _petSelection() {
    return GestureDetector(
        onTap: (){
          Get.to(Term());
        },
        child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 80,
        width: SizeConfig.screenWidth,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: petSelectionList.length,
          itemBuilder: (context, index) {
            return _petTile(pet: petSelectionList[index]);
          },
        ),
      ),
    );
  }


  // _petTile(idea,img,selected) {
  //   return Container(
  //     margin: EdgeInsets.only(left: 10),
  //     width: SizeConfig.screenWidth * 0.4,
  //     child: Stack(
  //       children: [
  //         Positioned(
  //             bottom: 0,
  //             child: Container(
  //               height: 60,
  //               width: SizeConfig.screenWidth * 0.4,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10),
  //                   color: selected
  //                       ? primaryColor
  //                       : Get.isDarkMode
  //                           ? liteGreyColor
  //                           : Colors.white
  //                   ),
  //             )),
  //         Positioned(
  //           left: 0,
  //           bottom: 0,
  //           child: Image.network(img, height: 80),
  //         ),
  //         Positioned(
  //           bottom: 12,
  //           right: 16,
  //           child: Text(idea,
  //               style: selected
  //                   ? titleTextStyle.copyWith(color: Colors.white)
  //                   : titleTextStyle),
  //         ),
  //       ],
  //     ),
  //   );
  // }


  _petTile({PetSelection pet}) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: SizeConfig.screenWidth * 0.4,
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: SizeConfig.screenWidth * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: pet.isSelected
                        ? primaryColor
                        : Get.isDarkMode
                            ? liteGreyColor
                            : Colors.white),
              )),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(pet.imgPath, height: 80),
          ),
          Positioned(
            bottom: 12,
            right: 16,
            child: Text(pet.petName,
                style: pet.isSelected
                    ? titleTextStyle.copyWith(color: Colors.white)
                    : titleTextStyle),
          ),
        ],
      ),
    );
  }



  _searchBar() {
    return Container(
      height: 45,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text(
        //   "Find Your",
        //   style: subHeadingTextStyle,
        // ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Awesome Pet",
            style: headingTextStyle,
          ),
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            iconSize: 25,
            color: Colors.green,
            splashColor: Colors.purple,
            onPressed: () {},
          )
        ])
      ]),
    );
  }

  _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeThemeMode(ThemeMode.light);
              } else {
                Get.changeThemeMode(ThemeMode.dark);
              }
            },
            icon: Icon(
              Get.isDarkMode ? FlutterIcons.sun_fea : FlutterIcons.moon_fea,
              color: Get.isDarkMode ? Colors.white : choclateColor,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(Asset.dp, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class PetTile extends StatelessWidget {
  final Pet pet;
  PetTile({this.pet});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PetDetailPage(pet: pet));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? liteGreyColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        height: SizeConfig.screenWidth * 0.6,
        width: SizeConfig.screenWidth * 0.4,
        child: Column(children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                    top: 1,
                    right: 1,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Get.isDarkMode
                                  ? Colors.white.withOpacity(0.01)
                                  : Colors.black.withOpacity(0.01),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 4,
                            )
                          ],
                          color: Get.isDarkMode ? liteGreyColor : Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FlutterIcons.heart_fou,
                          color: Colors.red,
                        )),
                  ),
                  Positioned(
                      bottom: 0,
                      child:
                      //  Image.asset(
                      //   pet.idea,
                      //   height: 120,
                      //   fit: BoxFit.scaleDown,
                      Text("idea")
                      ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              Text(
                pet.idea,
                style: titleTextStyle,
              ),
              Text(pet.formattedDate, style: body2TextStyle),
            ]),
            
          ])
        ]),
      ),
    );
  }
}
