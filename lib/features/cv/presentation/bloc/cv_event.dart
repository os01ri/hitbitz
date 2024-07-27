part of 'cv_bloc.dart';

abstract class CvEvent {
  const CvEvent();
}

class GetRoadmapsForCV extends CvEvent {}

class GetCategoriesForCV extends CvEvent {}

class SendCvEvent extends CvEvent {
  final SendCvParams params;
  SendCvEvent({
    required this.params,
  });
}
