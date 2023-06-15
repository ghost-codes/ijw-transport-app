import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:ijw_transport_app/utils/ui/loading/circular_progress.dart';

import '../ui/placeholders/App_empty_widget.dart';
import '../ui/widgets/refresh_wrapper.dart';
import 'data_widget.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext, T);

abstract class PaginatedDataWidget<T extends StatefulWidget, D, E> extends DataWidget<T> {
  final ScrollController scrollController = ScrollController();

  String get emptyMessage;

  bool _refreshing = false;

  Widget itemBuilder(BuildContext context, E item);

  final Map<int, D> data = {};

  int get currentPage;
  List<E> get dataList;
  int? get nextPage;

  Future<D> onLoadPage(int page);

  @override
  Future<void> onLoad() async {
    data[1] = await onLoadPage(1);
  }

  @override
  Future<void> onRefresh() async {
    // Do nothing
  }

  Future<void> loadPage(int page) async {
    loading = true;
    requestRender();

    try {
      final result = await onLoadPage(page);
      data[page] = result;
      lastError = null;
    } catch (e) {
      lastError = e;
      // AppCore.instance.logger.error("An error occurred while attempting to load data: $e");
    }

    loading = false;
    requestRender();
  }

  void clearData() {
    data.clear();
    loaded = false;
    requestRender();
  }

  Future<void> _onlistScrolled(ScrollMetrics metrics) async {
    if (loading || nextPage == null) return;

    final scrollDirection = scrollController.position.userScrollDirection;
    final maxExtent = metrics.maxScrollExtent;
    final extentAfter = metrics.extentAfter;

    if (scrollDirection != ScrollDirection.reverse) {
      return;
    }

    final minScroll = maxExtent * 0.4;
    final shouldLoadMore = extentAfter <= minScroll;

    if (!shouldLoadMore) return;

    await loadPage(nextPage!);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _onlistScrolled(notification.metrics);
        return false;
      },
      child: RefreshWrapper(
        controller: scrollController,
        onRefresh: () async {
          _refreshing = true;
          data.clear();
          await load();
          setState(() {
            _refreshing = true;
          });
        },
        body: Column(
          children: [
            if (loaded && !loading && dataList.isEmpty)
              AppEmptyWidget(
                message: emptyMessage,
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dataList.length,
              itemBuilder: (context, index) => itemBuilder.call(context, dataList[index]),
            ),
            if (loading && !_refreshing) ...[
              const SizedBox(height: 16),
              const AppCircularProgressIndicator(
                  // size: 50
                  ),
              const SizedBox(height: 16),
            ]
          ],
        ),
      ),
    );
  }
}
