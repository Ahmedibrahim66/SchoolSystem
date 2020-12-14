part of 'zoom_links_bloc.dart';

abstract class ZoomLinksState extends Equatable {
  const ZoomLinksState();
  
  @override
  List<Object> get props => [];
}

class ZoomLinksInitial extends ZoomLinksState {}

class ZoomLinksLoading extends ZoomLinksState{}

class ZoomLinksLoaded extends ZoomLinksState {
  final List<ZoomLinkModel> list;

  const ZoomLinksLoaded({@required this.list})
      : assert(list != null);

  @override
  List<Object> get props => [list];
}

class ZoomLinksError extends ZoomLinksState {}
