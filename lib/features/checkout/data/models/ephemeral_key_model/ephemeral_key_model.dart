import 'associated_object.dart';

class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKeyModel.fromJson(
      Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjects: (json['associated_objects'] as List<dynamic>?)
          ?.map((e) => AssociatedObject
              .fromIdEphkey1QLoeSllv2zZuYwqQpSbnbCqObjectEphemeralKeyAssociatedObjectsIdCusReh5JrSlv87CjlTypeCustomerCreated1731773712Expires1731777312LivemodeFalseSecretEkTestYwNjdF8xUuv4ZnlMtfYyelpVwXdxLDczcmlRodnnr1ZtT2pwNGdtM3VktHk5d2hTy3I0dzg00XiWwjYFn(
                  e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic>
      toIdEphkey1QLoeSllv2zZuYwqQpSbnbCqObjectEphemeralKeyAssociatedObjectsIdCusReh5JrSlv87CjlTypeCustomerCreated1731773712Expires1731777312LivemodeFalseSecretEkTestYwNjdF8xUuv4ZnlMtfYyelpVwXdxLDczcmlRodnnr1ZtT2pwNGdtM3VktHk5d2hTy3I0dzg00XiWwjYFn() {
    return {
      'id': id,
      'object': object,
      'associated_objects': associatedObjects
          ?.map((e) => e
              .toIdEphkey1QLoeSllv2zZuYwqQpSbnbCqObjectEphemeralKeyAssociatedObjectsIdCusReh5JrSlv87CjlTypeCustomerCreated1731773712Expires1731777312LivemodeFalseSecretEkTestYwNjdF8xUuv4ZnlMtfYyelpVwXdxLDczcmlRodnnr1ZtT2pwNGdtM3VktHk5d2hTy3I0dzg00XiWwjYFn())
          .toList(),
      'created': created,
      'expires': expires,
      'livemode': livemode,
      'secret': secret,
    };
  }
}
