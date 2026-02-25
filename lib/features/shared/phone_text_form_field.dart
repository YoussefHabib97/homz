import 'package:flutter/material.dart';
import 'package:homz/features/shared/base_text_form_field.dart';

class PhoneInputField extends StatefulWidget {
  final TextEditingController controller;
  // final Country initialCountry;

  const PhoneInputField({
    super.key,
    required this.controller,
    // required this.initialCountry,
  });

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Phone number',
        prefix: GestureDetector(
          onTap: _openCountryPicker,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(_selectedCountry.flag),
                const SizedBox(width: 6),
                // Text(_selectedCountry.dialCode),
                const SizedBox(width: 4),
                const Icon(Icons.keyboard_arrow_down, size: 20),
                const SizedBox(width: 8),
                Container(width: 1, height: 24, color: Colors.grey),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // late Country _selectedCountry;

  @override
  void initState() {
    // _selectedCountry = widget.initialCountry;
    super.initState();
  }

  Future<void> _openCountryPicker() async {
    // final country = await showDialog<Country>(
    //   context: context,
    //   builder: (_) => CountryPickerDialog(countries: countryList),
    // );

    // if (country != null) {
    //   setState(() {
    //     _selectedCountry = country;
    //   });
    // }
  }
}
