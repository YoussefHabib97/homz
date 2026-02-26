import 'package:flutter/material.dart';
import 'package:homz/features/shared/base_text_form_field.dart';

class CountryPickerWidget extends StatelessWidget {
  const CountryPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [Center(child: Text("Country Picker Form Placeholder"))],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("🇪🇬"),
            const SizedBox(width: 6),
            Text("+20"),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}

class PhoneNumberTextFormField extends StatefulWidget {
  final TextEditingController controller;
  // final Country initialCountry;

  const PhoneNumberTextFormField({
    super.key,
    required this.controller,
    // required this.initialCountry,
  });

  @override
  State<PhoneNumberTextFormField> createState() =>
      _PhoneNumberTextFormFieldState();
}

class _PhoneNumberTextFormFieldState extends State<PhoneNumberTextFormField> {
  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        prefixIcon: CountryPickerWidget(),
      ),
    );
  }

  // late Country _selectedCountry;

  @override
  void initState() {
    // _selectedCountry = widget.initialCountry;
    super.initState();
  }

  // Future<void> _openCountryPicker() async {
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
