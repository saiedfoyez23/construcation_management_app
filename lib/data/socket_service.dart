import 'dart:convert';
import 'package:construction_management_app/common/app_constant/app_constant.dart';
import 'package:construction_management_app/common/local_store/local_store.dart';
import 'package:construction_management_app/data/api.dart';
import 'package:construction_management_app/modules/authentication/sign_in/model/login_response_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket _socket;
  IO.Socket get socket => _socket;
  LoginResponseModel loginResponseModel = LoginResponseModel();

  Future<SocketService> init() async {
    print("hello socket");
    loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorage.getData(key: AppConstant.token)));
    print("Bearer ${loginResponseModel.data!.accessToken}");
    _socket = IO.io(Api.socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'extraHeaders': {
        'Authorization': loginResponseModel.data?.accessToken != null ? "Bearer ${loginResponseModel.data!.accessToken}" : ""
      },

    });

    _socket.on('connect', (data) {
      print('🟢 Socket connected');
      print('My Toke ID: ${loginResponseModel.data?.accessToken }');

      _socket.emit("connection", loginResponseModel.data?.accessToken);
      // Start sending location every 3 seconds after connection

      _socket.on('newOrder', (data) {
        print('newOrder event received: $data');
      });
    });

    _socket.onConnect((_) {
      print('🟢 Socket connected');
    });

    // _socket.on('onlineUser', (data) {
    //   onlineUserList.clear();
    //   for (var element in data) {
    //     if (element is String) {
    //       onlineUserList.add(element);
    //     }
    //   }
    //   print("Last user active on server: ${onlineUserList.length}");
    //   print("Last user: $onlineUserList");
    // });

    _socket.onDisconnect((_) {
      init();
      print('🔴 Socket disconnected');
      // Cancel location updates on disconnect
      //_stopLocationUpdates();
    });

    // Return the SocketService instance
    return this;
  }

  // Method to stop sending location updates
  // void _stopLocationUpdates() {
  //   _locationTimer?.cancel();
  //   _locationTimer = null;
  // }

  void disconnect() {
    //_stopLocationUpdates(); // Stop location updates before disconnecting
    _socket.disconnect();
  }

  Future<dynamic> emitWithAck(String event, dynamic data) async {
    return socket.emitWithAck(event, data);
  }

// void _handleIncomingFriends(dynamic data) {
//   if (data is Map<String, dynamic> && data.containsKey('receiver')) {
//    // _friendList.add(data);
//     print('Friend received and added to list: ${_friendList.length}');
//   }
// }
}