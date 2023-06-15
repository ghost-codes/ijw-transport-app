// import 'package:flutter/cupertino.dart';
// import 'package:ijw_transport_app/utils/data/paginated_data_widget.dart';

// class PaginatedGraphqlDataWidget<D> extends StatefulWidget {
//   const PaginatedGraphqlDataWidget({
//     super.key,
//     required this.itemBuilder,
//     required this.loader,
//     required this.emptyMessage,
//   });
//   // Always prefix item builder with the type of D eg . itemBuilder:<Transaction>(context,item){}
//   final Future<PaginatedDataResponse<D>> Function(BuildContext context, int page) loader;
//   final Widget Function(BuildContext context, D item) itemBuilder;
//   final String emptyMessage;

//   @override
//   State<PaginatedGraphqlDataWidget> createState() => PaginatedGraphqlDataWidgetState<D>();
// }

// class PaginatedGraphqlDataWidgetState<D>
//     extends PaginatedDataWidget<PaginatedGraphqlDataWidget, PaginatedDataResponse<D>, D> {
//   @override
//   String get emptyMessage => widget.emptyMessage;

//   @override
//   Future<PaginatedDataResponse<D>> onLoadPage(int page) async {
//     return await widget.loader.call(context, page) as PaginatedDataResponse<D>;
//   }

//   @override
//   int get currentPage {
//     if (data.isEmpty) return 1;

//     return data.values.last.pagination.currentPage;
//   }

//   @override
//   int? get nextPage {
//     if (!loaded) return 1;
//     if (data.isEmpty) return null;
//     return data.values.last.pagination.nextPage;
//   }

//   @override
//   List<D> get dataList => data.values.fold<List<D>>([], (preV, e) => preV..addAll(e.data));

//   @override
//   Widget itemBuilder(BuildContext context, D item) {
//     return widget.itemBuilder.call(context, item);
//   }
// }
