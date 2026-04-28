import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Contact {
  final String? id;
  final String name;
  final String phone;
  final String email;
  final String? address;

  Contact({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.address,
  });

  // Convert Contact to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address ?? '',
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  // Create Contact from Firestore document
  factory Contact.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Contact(
      id: doc.id,
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
    );
  }
}

class CrudService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'contacts';

  // Get current user ID
  String? get _userId => FirebaseAuth.instance.currentUser?.uid;

  // Get contacts collection reference for current user
  CollectionReference get _contactsCollection =>
      _firestore.collection(_collectionName);

  // Create a new contact
  Future<void> addContact(Contact contact) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      await _contactsCollection.add(contact.toMap());
    } catch (e) {
      throw Exception('Failed to add contact: $e');
    }
  }

  // Read all contacts for current user
  Stream<List<Contact>> getContacts() {
    if (_userId == null) return Stream.value([]);

    return _contactsCollection
        .where('userId', isEqualTo: _userId)
        .snapshots()
        .map((snapshot) {
      // Sort in memory instead of using orderBy
      final contacts = snapshot.docs.map((doc) => Contact.fromFirestore(doc)).toList();
      contacts.sort((a, b) {
        // Sort by name if createdAt is not available
        return a.name.compareTo(b.name);
      });
      return contacts;
    });
  }

  // Update a contact
  Future<void> updateContact(String contactId, Contact contact) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      await _contactsCollection.doc(contactId).update({
        'name': contact.name,
        'phone': contact.phone,
        'email': contact.email,
        'address': contact.address,
      });
    } catch (e) {
      throw Exception('Failed to update contact: $e');
    }
  }

  // Delete a contact
  Future<void> deleteContact(String contactId) async {
    if (_userId == null) throw Exception('User not authenticated');

    try {
      await _contactsCollection.doc(contactId).delete();
    } catch (e) {
      throw Exception('Failed to delete contact: $e');
    }
  }

  // Search contacts by name
  Stream<List<Contact>> searchContacts(String query) {
    if (_userId == null) return Stream.value([]);

    return _contactsCollection
        .where('userId', isEqualTo: _userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Contact.fromFirestore(doc))
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
