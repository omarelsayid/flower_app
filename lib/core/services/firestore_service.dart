import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_app/features/orders/data/model/driver_location_model.dart';


class FireStoreService {
  static final _firestore = FirebaseFirestore.instance;

  static Stream<Driver> driverCollectionStream(String driverId) {
    return _firestore.collection('drivers').doc(driverId).snapshots().map(
            (snapshot) => Driver.fromJson(snapshot.data() as Map<String, dynamic>));
  }

  static Future<Driver> getDriversOnce(String driverId) async {
    print('get');
    final snapshot =
        await FirebaseFirestore.instance.collection('drivers').doc(driverId).get();

    return Driver.fromJson(snapshot.data() as Map<String, dynamic>);
  }
}
