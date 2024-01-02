part of 'documents_bloc.dart';

@immutable
sealed class DocumentsState {}

final class DocumentsInitial extends DocumentsState {}

final class DocumentsViewState extends DocumentsState {
  final List<Tooth> teethListReport;
  final List<Tooth> teethListXray;
  final List<Tooth> teethListPrescription;

  DocumentsViewState(
      this.teethListReport, this.teethListXray, this.teethListPrescription);
}
