import 'package:explore/models/country_model.dart';
import 'package:explore/theme.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
   // ignore: use_key_in_widget_constructors
   const CountryScreen({required this.setCountryData});

   final Function setCountryData;

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}


class _CountryScreenState extends State<CountryScreen> {
  List<CountryModel> countries = [
    CountryModel(name: 'Afghanistan', code: '+93', flag: '🇦🇫'),
    CountryModel(name: 'Algeria', code: '+213', flag: '🇩🇿'),
    CountryModel(name: 'Angola', code: '+244', flag: '🇦🇴'),
    CountryModel(name: 'Argentina', code: '+54', flag: '🇦🇷'),
    CountryModel(name: 'Australia', code: '+61', flag: '🇦🇺'),
    CountryModel(name: 'Austria', code: '+43', flag: '🇦🇹'),
    CountryModel(name: 'Belgium', code: '+32', flag: '🇧🇪'),
    CountryModel(name: 'Brazil', code: '+55', flag:'🇧🇷' ),
    CountryModel(name: 'Cameroon', code: '+237', flag: '🇨🇲'),
    CountryModel(name: 'Canada', code: '+1', flag:'🇨🇦'),
    CountryModel(name: 'Chile', code: '+56', flag:'🇨🇱' ),
    CountryModel(name: 'China', code: '+86', flag: '🇨🇳'),
    CountryModel(name: 'Colombia', code: '+57', flag: '🇨🇴'),
    CountryModel(name: 'Croatia', code: '+385', flag: '🇭🇷'),
    CountryModel(name: 'Denmark', code: '+45', flag:'🇩🇰'),
    CountryModel(name: 'Egypt', code: '+20', flag:'🇪🇬'),
    CountryModel(name: 'France', code: '+33', flag: '🇫🇷'),
    CountryModel(name: 'Germany', code: '+49', flag: '🇩🇪'),
    CountryModel(name: 'Ghana', code: '+233', flag: '🇬🇭'),
    CountryModel(name: 'Greece', code: '+30', flag: '🇬🇷'),
    CountryModel(name: 'India', code: '+91', flag: '🇮🇳'),
    CountryModel(name: 'Indonesia', code: '+62', flag: '🇮🇩'),
    CountryModel(name: 'Italy', code: '+39', flag:'🇮🇹'),
    CountryModel(name: 'Ivory Coast', code:'+225' , flag: '🇨🇮'),
    CountryModel(name: 'Jamaica', code: '+1-876', flag: '🇯🇲'),
    CountryModel(name: 'Japan', code: '+81', flag: '🇯🇵'),
    CountryModel(name: 'Kenya', code: '+254', flag: '🇰🇪'),
    CountryModel(name: 'Mexico', code: '+52', flag: '🇲🇽'),
    CountryModel(name: 'Morocco', code: '+212', flag: '🇲🇦'),
    CountryModel(name: 'Netherlands', code: '+31', flag: '🇳🇱'),
    CountryModel(name: 'New Zealand', code: '+64', flag: '🇳🇿'),
    CountryModel(name: 'Nigeria', code: '+234', flag: '🇳🇬'),
    CountryModel(name: 'North Korea', code: '+850', flag: '🇰🇵'),
    CountryModel(name: 'Norway', code: '+47', flag: '🇳🇴'),
    CountryModel(name: 'Paraguay', code: '+595', flag: '🇵🇾'),
    CountryModel(name: 'Philippines', code: '+63', flag: '🇵🇭'),
    CountryModel(name: 'Poland', code: '+48', flag:'🇵🇱' ),
    CountryModel(name: 'Portugal', code: '+351', flag: '🇵🇹'),
    CountryModel(name: 'Qatar', code: '+974', flag: '🇶🇦'),
    CountryModel(name: 'Russia', code: '+7', flag: '🇷🇺'),
    CountryModel(name: 'Saudi Arabia', code: '+966', flag: '🇸🇦'),
    CountryModel(name: 'Senegal', code: '+221', flag: '🇸🇳'),
    CountryModel(name: 'Serbia', code: '+381', flag: '🇷🇸'),
    CountryModel(name: 'Singapore', code: '+65', flag: '🇸🇬'),
    CountryModel(name: 'South Africa', code: '+27', flag: '🇿🇦'),
    CountryModel(name: 'South Korea', code: '+82', flag:'🇰🇷'),
    CountryModel(name: 'Spain', code: '+34', flag:'🇪🇸'),
    CountryModel(name: 'Sweden', code: '+46', flag: '🇸🇪'),
    CountryModel(name: 'Switzerland', code:'+41', flag:'🇨🇭'),
    CountryModel(name: 'Thailand', code: '+66', flag: '🇹🇭'),
    CountryModel(name: 'Tunisia', code: '+216', flag: '🇹🇳'),
    CountryModel(name: 'Turkey', code: '+90', flag: '🇹🇷'),
    CountryModel(name: 'Ukraine', code: '+380', flag: '🇺🇦'),
    CountryModel(name: 'United Arab Emirates', code: '+971', flag:'🇦🇪'),
    CountryModel(name: 'United Kingdom', code:'+44', flag:'🇬🇧'),
    CountryModel(name: 'United States', code: '+1', flag: '🇺🇸'),
    CountryModel(name: 'Uruguay', code: '+598', flag:'🇺🇾'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        centerTitle: true,
        elevation:0,     
          leadingWidth: 45,
          leading: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap:(){
              Navigator.of(context).pop();
              },
              child:const Icon(
              Icons.arrow_back,
              color:AppColors.accent,
            )
            ),
          ),
          title: const Text('Choose a country',
          style:TextStyle(
          color:AppColors.accent,
          fontWeight:FontWeight.w600,
          wordSpacing: 1,
          fontSize:18,
        )
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColors.accent,
              ),
               onPressed: (){},
            )
          ],

      ),

      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: ((context, index) =>  
        countrySelector(countries[index],
        )),
    ),
    );
  }

  Widget countrySelector(CountryModel country){
     return InkWell(
      onTap:(){
        widget.setCountryData(country);
      },
       child: Card(
        margin: const EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding:const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child:Row(
            children: <Widget>[
              Text(country.flag),
              const SizedBox(width: 15),
              Text(country.name),
              Expanded(
                child: Container(
                  width:150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(country.code),
                    ],
                  )
                  ),
              ),
     
              ])
        )
        ),
     );
  }
}