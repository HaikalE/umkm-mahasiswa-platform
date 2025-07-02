import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Search Header
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.white,
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari produk, proyek, atau mahasiswa...',
                      prefixIcon: const Icon(Icons.search, color: AppColors.grey500),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // TODO: Implement filter
                        },
                        icon: const Icon(Icons.tune, color: AppColors.grey500),
                      ),
                      filled: true,
                      fillColor: AppColors.grey100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onSubmitted: (value) {
                      // TODO: Implement search
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  // Tab Bar
                  TabBar(
                    controller: _tabController,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.grey600,
                    indicatorColor: AppColors.primary,
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(text: 'Produk'),
                      Tab(text: 'Proyek'),
                      Tab(text: 'Mahasiswa'),
                    ],
                  ),
                ],
              ),
            ),
            
            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildProductsTab(),
                  _buildProjectsTab(),
                  _buildStudentsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsTab() {
    return const Center(
      child: Text(
        'Produk UMKM\n(Coming Soon)',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.grey600,
        ),
      ),
    );
  }

  Widget _buildProjectsTab() {
    return const Center(
      child: Text(
        'Proyek & Job\n(Coming Soon)',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.grey600,
        ),
      ),
    );
  }

  Widget _buildStudentsTab() {
    return const Center(
      child: Text(
        'Mahasiswa Talenta\n(Coming Soon)',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.grey600,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}