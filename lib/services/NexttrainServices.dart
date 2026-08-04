import '../models/NextTrainCardData.dart';

class NextTrainServices {
  static NextTrainCard getNextTrain() {
    List<NextTrainCard> trains = [
      NextTrainCard(LineName: "Green Line", minutes: "9 min away", platform: "platform 3"),
      NextTrainCard(LineName: "Red Line", minutes: "3 min away", platform: "platform 1"),
      NextTrainCard(LineName: "Blue Line", minutes: "10 min away", platform: "platform 2"),
    ];
    trains.shuffle();

    return trains.first;
  }
}
