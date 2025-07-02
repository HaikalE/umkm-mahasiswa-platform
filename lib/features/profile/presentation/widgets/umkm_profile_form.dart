import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/widgets/custom_text_field.dart';
import '../../../auth/presentation/widgets/auth_button.dart';

class UMKMProfileForm extends StatefulWidget {
  final int step;
  final VoidCallback onNext;
  final bool isLoading;

  const UMKMProfileForm({
    super.key,
    required this.step,
    required this.onNext,
    this.isLoading = false,
  });

  @override
  State<UMKMProfileForm> createState() => _UMKMProfileFormState();
}

class _UMKMProfileFormState extends State<UMKMProfileForm> {
  final _formKey = GlobalKey<FormState>();
  
  // Step 1 - Business Info
  final _businessNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Makanan & Minuman';
  final _addressController = TextEditingController();
  String _selectedProvince = 'DKI Jakarta';
  String _selectedCity = 'Jakarta Pusat';
  
  // Step 2 - Business Details
  final _websiteController = TextEditingController();
  final _instagramController = TextEditingController();
  final _whatsappController = TextEditingController();
  int _establishedYear = DateTime.now().year;
  String _employeeCount = '1-5';
  String _monthlyRevenue = 'Kurang dari 1 juta';
  
  // Step 3 - Verification
  bool _hasBusinessLicense = false;
  bool _hasNPWP = false;
  final _additionalInfoController = TextEditingController();

  final List<String> _businessCategories = [
    'Makanan & Minuman',
    'Fashion & Tekstil',
    'Teknologi',
    'Jasa',
    'Kerajinan',
    'Kecantikan & Kesehatan',
    'Otomotif',
    'Pertanian',
    'Lainnya'
  ];

  final List<String> _provinces = [
    'DKI Jakarta',
    'Jawa Barat',
    'Jawa Tengah',
    'Jawa Timur',
    'Sumatera Utara',
    'Sumatera Barat',
    'Lainnya'
  ];

  void _handleNext() {
    if (_formKey.currentState!.validate()) {
      widget.onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step Content
            Expanded(
              child: SingleChildScrollView(
                child: _buildStepContent(),
              ),
            ),
            
            // Bottom Button
            const SizedBox(height: 24),
            AuthButton(
              text: widget.step < 3 ? 'Lanjutkan' : 'Selesai',
              onPressed: _handleNext,
              isLoading: widget.isLoading,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (widget.step) {
      case 1:
        return _buildBusinessInfoStep();
      case 2:
        return _buildBusinessDetailsStep();
      case 3:
        return _buildVerificationStep();
      default:
        return Container();
    }
  }

  Widget _buildBusinessInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi Bisnis',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ceritakan tentang bisnis UMKM Anda',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 32),
        
        CustomTextField(
          controller: _businessNameController,
          label: 'Nama Bisnis',
          hintText: 'Masukkan nama bisnis Anda',
          prefixIcon: Icons.store_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nama bisnis tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _descriptionController,
          label: 'Deskripsi Bisnis',
          hintText: 'Jelaskan produk/jasa yang Anda tawarkan...',
          maxLines: 4,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Deskripsi bisnis tidak boleh kosong';
            }
            if (value.length < 50) {
              return 'Deskripsi minimal 50 karakter';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
        
        // Category Selector
        const Text(
          'Kategori Bisnis',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.grey50,
            border: Border.all(color: AppColors.grey300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            value: _selectedCategory,
            isExpanded: true,
            underline: const SizedBox(),
            items: _businessCategories
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _addressController,
          label: 'Alamat Lengkap',
          hintText: 'Masukkan alamat bisnis Anda',
          prefixIcon: Icons.location_on_outlined,
          maxLines: 2,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Alamat tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        // Province and City
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Provinsi',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      border: Border.all(color: AppColors.grey300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedProvince,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: _provinces
                          .map((province) => DropdownMenuItem(
                                value: province,
                                child: Text(province),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedProvince = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kota',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.grey50,
                      border: Border.all(color: AppColors.grey300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedCity,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: ['Jakarta Pusat', 'Jakarta Utara', 'Jakarta Selatan']
                          .map((city) => DropdownMenuItem(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBusinessDetailsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detail Bisnis',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Informasi tambahan tentang bisnis Anda',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 32),
        
        CustomTextField(
          controller: _websiteController,
          label: 'Website (Opsional)',
          hintText: 'https://yourbusiness.com',
          prefixIcon: Icons.language_outlined,
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _instagramController,
          label: 'Instagram (Opsional)',
          hintText: '@yourbusiness',
          prefixIcon: Icons.camera_alt_outlined,
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _whatsappController,
          label: 'WhatsApp Business',
          hintText: '08123456789',
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nomor WhatsApp tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
        
        // Established Year
        const Text(
          'Tahun Berdiri',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.grey50,
            border: Border.all(color: AppColors.grey300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<int>(
            value: _establishedYear,
            isExpanded: true,
            underline: const SizedBox(),
            items: List.generate(30, (index) => DateTime.now().year - index)
                .map((year) => DropdownMenuItem(
                      value: year,
                      child: Text(year.toString()),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _establishedYear = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        
        // Employee Count
        const Text(
          'Jumlah Karyawan',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.grey50,
            border: Border.all(color: AppColors.grey300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            value: _employeeCount,
            isExpanded: true,
            underline: const SizedBox(),
            items: ['1-5', '6-10', '11-20', '21-50', '>50']
                .map((count) => DropdownMenuItem(
                      value: count,
                      child: Text('$count orang'),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _employeeCount = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        
        // Monthly Revenue
        const Text(
          'Omzet Bulanan',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.grey50,
            border: Border.all(color: AppColors.grey300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            value: _monthlyRevenue,
            isExpanded: true,
            underline: const SizedBox(),
            items: [
              'Kurang dari 1 juta',
              '1-5 juta',
              '5-10 juta',
              '10-25 juta',
              'Lebih dari 25 juta'
            ]
                .map((revenue) => DropdownMenuItem(
                      value: revenue,
                      child: Text(revenue),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _monthlyRevenue = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verifikasi & Info Tambahan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Informasi untuk verifikasi akun Anda',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 32),
        
        // Business License
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.grey200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dokumen Legalitas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey900,
                ),
              ),
              const SizedBox(height: 16),
              
              CheckboxListTile(
                value: _hasBusinessLicense,
                onChanged: (value) {
                  setState(() {
                    _hasBusinessLicense = value ?? false;
                  });
                },
                title: const Text(
                  'Memiliki Surat Izin Usaha',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey700,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.primary,
              ),
              
              CheckboxListTile(
                value: _hasNPWP,
                onChanged: (value) {
                  setState(() {
                    _hasNPWP = value ?? false;
                  });
                },
                title: const Text(
                  'Memiliki NPWP',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey700,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        CustomTextField(
          controller: _additionalInfoController,
          label: 'Informasi Tambahan (Opsional)',
          hintText: 'Ceritakan hal unik tentang bisnis Anda atau kebutuhan khusus dalam mencari talenta mahasiswa...',
          maxLines: 4,
        ),
        const SizedBox(height: 32),
        
        // Info Box
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.info.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.info.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.info,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Tim kami akan meninjau informasi Anda untuk verifikasi. Proses ini biasanya memakan waktu 1-2 hari kerja.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.info,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _websiteController.dispose();
    _instagramController.dispose();
    _whatsappController.dispose();
    _additionalInfoController.dispose();
    super.dispose();
  }
}