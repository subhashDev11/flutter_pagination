import 'package:flutter/material.dart';
import 'package:pagination_assignment/dashboard_pagination/widgets/paginated_list_widget.dart';

class DashboardPagination extends StatelessWidget {
  const DashboardPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListPaginationWidget(),
    );
  }
}
