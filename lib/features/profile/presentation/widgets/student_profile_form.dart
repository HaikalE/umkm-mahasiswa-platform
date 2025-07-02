import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/widgets/custom_text_field.dart';
import '../../../auth/presentation/widgets/auth_button.dart';

class StudentProfileForm extends StatefulWidget {
  final int step;
  final VoidCallback onNext;
  final bool isLoading;

  const StudentProfileForm({
    super.key,
    required this.step,
    required this.onNext,
    this.isLoading = false,
  });

  @override
  State<StudentProfileForm> createState() => _StudentProfileFormState();
}

class _StudentProfileFormState extends State<StudentProfileForm> {
  final _formKey = GlobalKey<FormState>();
  
  // Step 1 - Basic Info
  final _fullNameController = TextEditingController();
  final _nimController = TextEditingController();
  final _universityController = TextEditingController();
  final _majorController = TextEditingController();
  int _selectedSemester = 1;
  int _graduationYear = DateTime.now().year + 2;
  
  // Step 2 - Skills & Interests
  final List<String> _availableSkills = [
    'UI/UX Design', 'Flutter', 'React', 'Node.js', 'Python',
    'Digital Marketing', 'Content Writing', 'Photography',
    'Video Editing', 'Graphic Design', 'Data Analysis',
    'Business Development', 'Social Media Management'
  ];
  final List<String> _selectedSkills = [];
  final _bioController = TextEditingController();
  
  // Step 3 - Portfolio & Links
  final _portfolioUrlController = TextEditingController();
  final _linkedinController = TextEditingController();
  final _githubController = TextEditingController();
  final _behanceController = TextEditingController();
  int _minRate = 50000;
  int _maxRate = 100000;

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
        return _buildBasicInfoStep();
      case 2:
        return _buildSkillsStep();
      case 3:
        return _buildPortfolioStep();
      default:
        return Container();
    }
  }

  Widget _buildBasicInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi Dasar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ceritakan tentang diri Anda sebagai mahasiswa',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 32),
        
        CustomTextField(
          controller: _fullNameController,
          label: 'Nama Lengkap',
          hintText: 'Masukkan nama lengkap Anda',
          prefixIcon: Icons.person_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nama lengkap tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _nimController,
          label: 'NIM',
          hintText: 'Masukkan NIM Anda',
          prefixIcon: Icons.badge_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'NIM tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _universityController,
          label: 'Universitas',
          hintText: 'Masukkan nama universitas Anda',
          prefixIcon: Icons.school_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Universitas tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _majorController,
          label: 'Jurusan',
          hintText: 'Masukkan jurusan Anda',
          prefixIcon: Icons.book_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Jurusan tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
        
        // Semester Selector
        const Text(
          'Semester',
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
            value: _selectedSemester,
            isExpanded: true,
            underline: const SizedBox(),
            items: List.generate(14, (index) => index + 1)
                .map((semester) => DropdownMenuItem(
                      value: semester,
                      child: Text('Semester $semester'),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedSemester = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        
        // Graduation Year
        const Text(
          'Tahun Lulus',
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
            value: _graduationYear,
            isExpanded: true,
            underline: const SizedBox(),
            items: List.generate(10, (index) => DateTime.now().year + index)
                .map((year) => DropdownMenuItem(
                      value: year,
                      child: Text(year.toString()),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _graduationYear = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Keahlian & Minat',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Pilih keahlian dan ceritakan tentang diri Anda',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 32),
        
        const Text(
          'Keahlian',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Pilih minimal 3 keahlian yang Anda kuasai',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 16),
        
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _availableSkills.map((skill) {
            final isSelected = _selectedSkills.contains(skill);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedSkills.remove(skill);
                  } else {
                    _selectedSkills.add(skill);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withOpacity(0.1)
                      : AppColors.grey100,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.grey300,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  skill,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.primary : AppColors.grey700,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        
        CustomTextField(
          controller: _bioController,
          label: 'Bio',
          hintText: 'Ceritakan tentang diri Anda, pengalaman, dan tujuan karir...',
          maxLines: 4,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Bio tidak boleh kosong';
            }
            if (value.length < 50) {
              return 'Bio minimal 50 karakter';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPortfolioStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Portfolio & Kontak',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tambahkan link portfolio dan media sosial profesional',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 32),
        
        CustomTextField(
          controller: _portfolioUrlController,
          label: 'Website Portfolio (Opsional)',
          hintText: 'https://yourportfolio.com',
          prefixIcon: Icons.link_outlined,
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _linkedinController,
          label: 'LinkedIn (Opsional)',
          hintText: 'https://linkedin.com/in/username',
          prefixIcon: Icons.link_outlined,
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _githubController,
          label: 'GitHub (Opsional)',
          hintText: 'https://github.com/username',
          prefixIcon: Icons.code_outlined,
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 16),
        
        CustomTextField(
          controller: _behanceController,
          label: 'Behance (Opsional)',
          hintText: 'https://behance.net/username',
          prefixIcon: Icons.palette_outlined,
          keyboardType: TextInputType.url,
        ),
        const SizedBox(height: 32),
        
        // Rate Range
        const Text(
          'Tarif Kerja per Jam',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey900,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tentukan range tarif yang Anda harapkan',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.grey600,
          ),
        ),
        const SizedBox(height: 16),
        
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Minimum',
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
                      value: _minRate,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: [25000, 50000, 75000, 100000, 150000]
                          .map((rate) => DropdownMenuItem(
                                value: rate,
                                child: Text('Rp ${rate ~/ 1000}k'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _minRate = value!;
                          if (_maxRate < _minRate) {
                            _maxRate = _minRate;
                          }
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
                    'Maksimum',
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
                      value: _maxRate,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: [50000, 75000, 100000, 150000, 200000, 300000]
                          .where((rate) => rate >= _minRate)
                          .map((rate) => DropdownMenuItem(
                                value: rate,
                                child: Text('Rp ${rate ~/ 1000}k'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _maxRate = value!;
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

  @override
  void dispose() {
    _fullNameController.dispose();
    _nimController.dispose();
    _universityController.dispose();
    _majorController.dispose();
    _bioController.dispose();
    _portfolioUrlController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
    _behanceController.dispose();
    super.dispose();
  }
}