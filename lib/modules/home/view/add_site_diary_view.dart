import 'package:construction_management_app/common/common.dart';
import 'package:construction_management_app/modules/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AddSiteDiaryView extends StatefulWidget {
  const AddSiteDiaryView({super.key});

  @override
  State<AddSiteDiaryView> createState() => _AddSiteDiaryViewState();
}

class _AddSiteDiaryViewState extends State<AddSiteDiaryView> {
  String project = 'Green Valley School 0';
  TextEditingController weatherConditionController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController audioController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }


  void _listen() async {
    if (!_isListening) {
      print("hello");
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      print(available);
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            audioController.text = val.recognizedWords;
          }),
          pauseFor: Duration(seconds: 3),  // Pause after 3 seconds of silence to stop recording
          listenFor: Duration(seconds: 30),  // Max listening time
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  List<String> projects = [
    'Green Valley School 0',
    'Green Valley School 1',
    'Green Valley School 2'
  ];

  String supervisor = 'Jane Cooper';

  String _description = 'Excavation of trench for pipeline along the eastern boundary.';

  DateTime _date = DateTime(2025, 5, 10);

  String _weather = 'Sunny';

  String _taskName = '';

  String _location = 'Site 5, Section A';

  // Workforce
  String _selectedWorker = 'Laborers';

  int _workerQuantity = 1;

  int _workerDuration = 4;

  List<Map<String, dynamic>> _workforceList = [
    {'type': 'Laborers', 'quantity': 4, 'duration': 4},
    {'type': 'Engineer', 'quantity': 4, 'duration': 4},
    {'type': 'Electrician', 'quantity': 2, 'duration': 4},
  ];

  // Equipment
  String _selectedEquipment = 'Excavator';

  int _equipmentQuantity = 1;

  int _equipmentDuration = 4;

  List<Map<String, dynamic>> _equipmentList = [
    {'type': 'Excavator', 'quantity': 1, 'duration': 4},
    {'type': 'Concrete Mixer', 'quantity': 1, 'duration': 4},
  ];

  // Photo
  String? _photoUrl;
 // Start without photo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 812.h(context),
          width: 375.w(context),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackGroundColor,
          ),
          child: CustomScrollView(
            slivers: [

              CustomAppBarHelper.normalAppBar(
                context: context,
                onBackPressed: () {
                  Get.off(()=>DashboardView(index: 0),preventDuplicates: false);
                },
                title: 'Upload New',
              ),
        
        
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SpaceHelperClass.v(24.h(context)),

                      Container(
                        width: 375.w(context),
                        padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            TextHelperClass.headingText(
                              context: context,
                              text: "Project Select",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),


                            CustomDropdownHelperClass<String>(
                              value: project,
                              items: projects,
                              onChanged: (value) {
                                setState(() => project = value!);
                              },
                              hintText: "Select project",
                            ),

                            SpaceHelperClass.v(16.h(context)),
                            

                            TextHelperClass.headingText(
                              context: context,
                              text: "Supervisor\'s Name",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),


                            SpaceHelperClass.v(8.h(context)),



                            TextHelperClass.headingText(
                              context: context,
                              text: "${supervisor}",
                              fontSize: 20,
                              textColor: AppColors.black38,
                              fontWeight: FontWeight.w500,
                            ),



                            SpaceHelperClass.v(16.h(context)),
                            
                            Container(
                              width: 375.w(context),
                              padding: EdgeInsets.symmetric(horizontal: 8.hpm(context), vertical:  6.vpm(context),),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r(context)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(4, 6, 15, 0.05),
                                    blurRadius: 60,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  TextHelperClass.headingText(
                                    context: context,
                                    text: "Description",
                                    fontSize: 20,
                                    textColor: AppColors.black65,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  SpaceHelperClass.v(8.h(context)),

                                  CustomTextFormFieldClass.textFiledWithMaxLineBuild(
                                    context: context,
                                    controller: descriptionController,
                                    hintText: "Write something.....",
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 9.hpm(context),
                                      vertical: 8.vpm(context),
                                    ),
                                    maxLines: 4,
                                    borderRadius: 8,
                                    borderColor: Color.fromRGBO(24, 147, 248, 1),
                                  ),


                                  SpaceHelperClass.v(16.h(context)),

                                  Row(
                                    children: [


                                      Expanded(
                                        child: CustomTextFormFieldClass.build(
                                          context: context,
                                          controller: audioController,
                                          readOnly: true,
                                          hintText: 'Ask Something..',
                                          keyboardType: TextInputType.text,
                                          borderRadius: 8,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12.hpm(context),
                                            vertical: 8.vpm(context),
                                          ),
                                          prefixIcon: IconButton(
                                            onPressed: () async {
                                              print("hello");
                                              _listen();
                                            },
                                            icon: Icon(
                                              Icons.mic,
                                              color: _isListening ? Colors.red : Color.fromRGBO(117, 131, 141, 1),
                                              size: 24.r(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      SpaceHelperClass.h(8.w(context)),


                                      ImageHelperClass.customImageButtonContainer(
                                        onPressed: () async {
                                          if(audioController.text != "") {
                                            descriptionController.text = audioController.text;
                                            audioController.clear();
                                          }
                                        },
                                        context: context,
                                        height: 55,
                                        width: 50,
                                        borderRadius: BorderRadius.circular(8.r(context)),
                                        imagePath: AppImages.sendIcon,
                                        imageFit: BoxFit.cover,
                                        fit: BoxFit.contain,
                                      ),
                                      


                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            
                            SpaceHelperClass.v(16.h(context)),

                            TextHelperClass.headingText(
                              context: context,
                              text: "Date",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),
                            SpaceHelperClass.v(8.h(context)),


                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: dateTimeController,
                              hintText: "Select A Date",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              suffixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.vpm(context),
                                  horizontal: 16.hpm(context),
                                ),
                                child: ImageHelperClass.customImageContainer(
                                  context: context,
                                  height: 24.h(context),
                                  width: 24.w(context),
                                  imagePath: AppImages.addSiteDiary,
                                  imageFit: BoxFit.contain,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              readOnly: true,
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: _date,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (picked != null) {
                                  setState(() {
                                    _date = picked;
                                    dateTimeController.text = DateFormat('MMMM dd, yyyy').format(_date);
                                  });
                                }
                              }
                            ),

                            SpaceHelperClass.v(16.h(context)),


                            TextHelperClass.headingText(
                              context: context,
                              text: "Weather condition",
                              fontSize: 20,
                              textColor: AppColors.black65,
                              fontWeight: FontWeight.w700,
                            ),

                            SpaceHelperClass.v(8.h(context)),

                            CustomTextFormFieldClass.build(
                              context: context,
                              controller: weatherConditionController,
                              hintText: "Weather condition",
                              borderColor: Color.fromRGBO(229, 231, 235, 1),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.hpm(context),
                                vertical: 8.vpm(context),
                              ),
                              borderRadius: 8,
                              keyboardType: TextInputType.text,
                            ),


                          ],
                        ),
                      ),


                      SpaceHelperClass.v(24.h(context)),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Add Task', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          TextButton(
                            onPressed: () {},
                            child: Text('+ Add task', style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('Task Name', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Enter task Name'),
                        onChanged: (value) => _taskName = value,
                      ),
                      SizedBox(height: 24),
                      Text('Workforce', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 8),
                      Text('Worker', style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButtonFormField<String>(
                        value: _selectedWorker,
                        items: ['Laborers', 'Engineer', 'Electrician'].map((String value) {
                          return DropdownMenuItem<String>(value: value, child: Text(value));
                        }).toList(),
                        onChanged: (value) => setState(() => _selectedWorker = value!),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue: _workerQuantity.toString(),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => _workerQuantity = int.tryParse(value) ?? 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Duration', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue: '$_workerDuration Hour',
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => _workerDuration = int.tryParse(value.split(' ')[0]) ?? 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _workforceList.add({
                              'type': _selectedWorker,
                              'quantity': _workerQuantity,
                              'duration': _workerDuration,
                            });
                          });
                        },
                        child: Text('+ Add New'),
                        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
                      ),
                      SizedBox(height: 8),
                      ..._workforceList.map((item) => _buildAddedItem(
                        '${item['quantity']} ${item['type']}',
                        '${item['duration']} hour',
                        Icons.people,
                            () => setState(() => _workforceList.remove(item)),
                      )),
                      SizedBox(height: 24),
                      Text('Equipment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 8),
                      Text('Select', style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButtonFormField<String>(
                        value: _selectedEquipment,
                        items: ['Excavator', 'Concrete Mixer'].map((String value) {
                          return DropdownMenuItem<String>(value: value, child: Text(value));
                        }).toList(),
                        onChanged: (value) => setState(() => _selectedEquipment = value!),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue: _equipmentQuantity.toString(),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => _equipmentQuantity = int.tryParse(value) ?? 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Duration', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue: '$_equipmentDuration Hour',
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => _equipmentDuration = int.tryParse(value.split(' ')[0]) ?? 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _equipmentList.add({
                              'type': _selectedEquipment,
                              'quantity': _equipmentQuantity,
                              'duration': _equipmentDuration,
                            });
                          });
                        },
                        child: Text('+ Add New'),
                        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
                      ),
                      SizedBox(height: 8),
                      ..._equipmentList.map((item) => _buildAddedItem(
                        '${item['quantity']} ${item['type']}',
                        '${item['duration']} hour',
                        Icons.build,
                            () => setState(() => _equipmentList.remove(item)),
                      )),
                      SizedBox(height: 24),
                      Text('Site Capture', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(height: 16),
                      if (_photoUrl == null)
                        Center(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt, color: Colors.white, size: 40),
                                  onPressed: () {
                                    // Simulate capturing photo
                                    setState(() => _photoUrl = 'https://via.placeholder.com/400x200?text=Excavator'); // Placeholder
                                  },
                                  padding: EdgeInsets.all(24),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('Capture Photo', style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        )
                      else ...[
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                _photoUrl!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => setState(() => _photoUrl = null),
                            ),
                          ],
                        ),
                      ],
                      if (_photoUrl != null) SizedBox(height: 8),
                      if (_photoUrl != null)
                        ElevatedButton(
                          onPressed: () {
                            // Simulate recapture
                            setState(() => _photoUrl = 'https://via.placeholder.com/400x200?text=New+Photo');
                          },
                          child: Text('Recapture Photo'),
                          style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
                        ),
                      SizedBox(height: 16),
                      Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      TextFormField(
                        initialValue: _location,
                        decoration: InputDecoration(prefixIcon: Icon(Icons.location_on)),
                        onChanged: (value) => _location = value,
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Save Log'),
                        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          foregroundColor: Colors.black54,
                          minimumSize: Size(double.infinity, 48),
                        ),
                      ),
                    ],
                  ),
                ),
              )
        
            ],
          )
        ),
      ),
    );
  }

  Widget _buildAddedItem(String title, String subtitle, IconData icon, VoidCallback onDelete) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(subtitle, style: TextStyle(fontSize: 12)),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
