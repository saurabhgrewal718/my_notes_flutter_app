import '../assets.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

class Pet {
  final String petName;
  final String petType;
  final String imgPath;
  final bool isFavorite;
  final String petStory;

  Pet(
      {this.petName,
      this.petType,
      this.imgPath,
      this.isFavorite,
      this.petStory});
}

List<Pet> petList = [
  Pet(
    petName: "Oliver,",
    imgPath: Asset.cat1,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
  Pet(
    petName: "Oscar,",
    imgPath: Asset.cat2,
    isFavorite: false,
    petType: "Munchkin",
    petStory: catDes2,
  ),
  Pet(
    petName: "Dextoer",
    imgPath: Asset.cat3,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes3,
  ),
  Pet(
    petName: "Kitty",
    imgPath: Asset.cat4,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes4,
  ),
  Pet(
    petName: "Oliver,",
    imgPath: Asset.cat1,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
  Pet(
    petName: "Oliver,",
    imgPath: Asset.cat1,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
  Pet(
    petName: "Oliver,",
    imgPath: Asset.cat1,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  ),
  Pet(
    petName: "Oliver,",
    imgPath: Asset.cat1,
    isFavorite: true,
    petType: "Munchkin",
    petStory: catDes1,
  )
];