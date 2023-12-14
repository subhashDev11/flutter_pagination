import 'package:flutter/material.dart';
import 'package:pagination_assignment/core/app_enums.dart';
import 'package:pagination_assignment/dashboard_pagination/data_model/lead_data_model/lead_data_model.dart';
import 'package:pagination_assignment/dashboard_pagination/state/list_paginator_state.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'item_card.dart';

class ListPaginationWidget extends StatelessWidget {
  const ListPaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lead Data",
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => ListPaginationState(),
        child: Consumer<ListPaginationState>(
          builder: (BuildContext context, ListPaginationState controller,
              Widget? _) {
            switch (controller.dataState) {
              case DataState.uninitialized:
                Future(() {
                  controller.fetchData();
                });
                return _ListViewWidget(controller.dataList, true);
              case DataState.initialFetching:
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                      15,
                      (index) => const InitialLoadingShimmer(),
                    ),
                  ),
                );
              case DataState.moreFetching:
              case DataState.refreshing:
                return _ListViewWidget(controller.dataList, true);
              case DataState.fetched:
                return _ListViewWidget(controller.dataList, false);
              case DataState.error:
                return Center(
                  child: InkWell(
                      onTap: () {
                        controller.fetchData();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Failed to load try to reload"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.refresh),
                        ],
                      )),
                );
              case DataState.noMoreData:
                return _ListViewWidget(controller.dataList, false);
            }
          },
        ),
      ),
    );
  }
}

class InitialLoadingShimmer extends StatelessWidget {
  const InitialLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(
          15,
        ),
        child: Shimmer(
          duration: const Duration(seconds: 3),
          interval: const Duration(seconds: 5),
          colorOpacity: 0.3,
          enabled: true,
          color: Colors.grey.shade500,
          direction: const ShimmerDirection.fromLTRB(),
          child: const SizedBox(
            height: 120,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  final List<LeadDataModel> _data;
  bool _isLoading;

  _ListViewWidget(this._data, this._isLoading);

  DataState? _dataState;

  @override
  Widget build(BuildContext context) {
    _dataState = Provider.of<ListPaginationState>(
      context,
      listen: false,
    ).dataState;

    return SafeArea(
      child: _scrollNotificationWidget(context),
    );
  }

  Widget _scrollNotificationWidget(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) => _scrollNotification(
                    context,
                    scrollInfo: scrollNotification),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await _onRefresh(context);
                  },
                  child: ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      if (_data.length - 1 == index) {
                        if (_dataState == DataState.moreFetching ||
                            _dataState == DataState.noMoreData) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_dataState == DataState.moreFetching)
                                    const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator())
                                  else if (_dataState == DataState.noMoreData)
                                    Text(
                                      "No more data",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }
                      return ItemCard(item: _data[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _scrollNotification(BuildContext context,
      {required ScrollNotification scrollInfo}) {
    if (!_isLoading &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      _isLoading = true;
      Provider.of<ListPaginationState>(
        context,
        listen: false,
      ).fetchData();
    }
    return true;
  }

  _onRefresh(BuildContext context) async {
    if (!_isLoading) {
      _isLoading = true;
      Provider.of<ListPaginationState>(context, listen: false)
          .fetchData(isRefresh: true);
    }
  }
}
