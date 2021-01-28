  $ ../../integration.exe patient-stu3.json
  Registering STU3 parser
  Starting with: Patient
  Patient is parent? Patient.id
  Is parent
  Patient.id is parent? Patient.meta
  Emitting:Patient.id
  Patient.meta is parent? Patient.implicitRules
  Emitting:Patient.meta
  Patient.implicitRules is parent? Patient.language
  Emitting:Patient.implicitRules
  Patient.language is parent? Patient.text
  Emitting:Patient.language
  Patient.text is parent? Patient.contained
  Emitting:Patient.text
  Patient.contained is parent? Patient.extension
  Emitting:Patient.contained
  Patient.extension is parent? Patient.modifierExtension
  Emitting:Patient.extension
  Patient.modifierExtension is parent? Patient.identifier
  Emitting:Patient.modifierExtension
  Patient.identifier is parent? Patient.active
  Emitting:Patient.identifier
  Patient.active is parent? Patient.name
  Emitting:Patient.active
  Patient.name is parent? Patient.telecom
  Emitting:Patient.name
  Patient.telecom is parent? Patient.gender
  Emitting:Patient.telecom
  Patient.gender is parent? Patient.birthDate
  Emitting:Patient.gender
  Patient.birthDate is parent? Patient.deceased[x]
  Emitting:Patient.birthDate
  Patient.deceased[x] is parent? Patient.address
  Emitting:Patient.deceased[x]
  Patient.address is parent? Patient.maritalStatus
  Emitting:Patient.address
  Patient.maritalStatus is parent? Patient.multipleBirth[x]
  Emitting:Patient.maritalStatus
  Patient.multipleBirth[x] is parent? Patient.photo
  Emitting:Patient.multipleBirth[x]
  Patient.photo is parent? Patient.contact
  Emitting:Patient.photo
  Patient.contact is parent? Patient.contact.id
  Is parent
  Patient.contact.id is parent? Patient.contact.extension
  Emitting:Patient.contact.id
  Patient.contact.extension is parent? Patient.contact.modifierExtension
  Emitting:Patient.contact.extension
  Patient.contact.modifierExtension is parent? Patient.contact.relationship
  Emitting:Patient.contact.modifierExtension
  Patient.contact.relationship is parent? Patient.contact.name
  Emitting:Patient.contact.relationship
  Patient.contact.name is parent? Patient.contact.telecom
  Emitting:Patient.contact.name
  Patient.contact.telecom is parent? Patient.contact.address
  Emitting:Patient.contact.telecom
  Patient.contact.address is parent? Patient.contact.gender
  Emitting:Patient.contact.address
  Patient.contact.gender is parent? Patient.contact.organization
  Emitting:Patient.contact.gender
  Patient.contact.organization is parent? Patient.contact.period
  Emitting:Patient.contact.organization
  Patient.contact.period is parent? Patient.animal
  Emitting:Patient.contact.period
  Patient.animal is parent? Patient.animal.id
  Is parent
  Patient.animal.id is parent? Patient.animal.extension
  Emitting:Patient.animal.id
  Patient.animal.extension is parent? Patient.animal.modifierExtension
  Emitting:Patient.animal.extension
  Patient.animal.modifierExtension is parent? Patient.animal.species
  Emitting:Patient.animal.modifierExtension
  Patient.animal.species is parent? Patient.animal.breed
  Emitting:Patient.animal.species
  Patient.animal.breed is parent? Patient.animal.genderStatus
  Emitting:Patient.animal.breed
  Patient.animal.genderStatus is parent? Patient.communication
  Emitting:Patient.animal.genderStatus
  Patient.communication is parent? Patient.communication.id
  Is parent
  Patient.communication.id is parent? Patient.communication.extension
  Emitting:Patient.communication.id
  Patient.communication.extension is parent? Patient.communication.modifierExtension
  Emitting:Patient.communication.extension
  Patient.communication.modifierExtension is parent? Patient.communication.language
  Emitting:Patient.communication.modifierExtension
  Patient.communication.language is parent? Patient.communication.preferred
  Emitting:Patient.communication.language
  Patient.communication.preferred is parent? Patient.generalPractitioner
  Emitting:Patient.communication.preferred
  Patient.generalPractitioner is parent? Patient.managingOrganization
  Emitting:Patient.generalPractitioner
  Patient.managingOrganization is parent? Patient.link
  Emitting:Patient.managingOrganization
  Patient.link is parent? Patient.link.id
  Is parent
  Patient.link.id is parent? Patient.link.extension
  Emitting:Patient.link.id
  Patient.link.extension is parent? Patient.link.modifierExtension
  Emitting:Patient.link.extension
  Patient.link.modifierExtension is parent? Patient.link.other
  Emitting:Patient.link.modifierExtension
  Patient.link.other is parent? Patient.link.type
  Emitting:Patient.link.other
  ((name Patient)
   (fields
    ((Field
      ((path (Patient link other)) (id Patient.link.other)
       (datatype
        (Union
         ((l2 other)
          (field_types
           ((Complex ((l other) (components ())))
            (Complex ((l other) (components ()))))))))))
     (Field
      ((path (Patient link modifierExtension))
       (id Patient.link.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Patient link extension)) (id Patient.link.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Patient link)) (id Patient.link)
       (datatype
        (Complex
         ((l link)
          (components ((Scalar ((scalar_type String) (required false))))))))))
     (Field
      ((path (Patient managingOrganization)) (id Patient.managingOrganization)
       (datatype (Complex ((l managingOrganization) (components ()))))))
     (Field
      ((path (Patient generalPractitioner)) (id Patient.generalPractitioner)
       (datatype
        (Union
         ((l2 generalPractitioner)
          (field_types
           ((Complex ((l generalPractitioner) (components ())))
            (Complex ((l generalPractitioner) (components ()))))))))))
     (Field
      ((path (Patient communication preferred))
       (id Patient.communication.preferred)
       (datatype (Scalar ((scalar_type Boolean) (required false))))))
     (Field
      ((path (Patient communication language))
       (id Patient.communication.language)
       (datatype (Complex ((l language) (components ()))))))
     (Field
      ((path (Patient communication modifierExtension))
       (id Patient.communication.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Patient communication extension))
       (id Patient.communication.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Patient communication)) (id Patient.communication)
       (datatype
        (Complex
         ((l communication)
          (components ((Scalar ((scalar_type String) (required false))))))))))
     (Field
      ((path (Patient animal genderStatus)) (id Patient.animal.genderStatus)
       (datatype (Complex ((l genderStatus) (components ()))))))
     (Field
      ((path (Patient animal breed)) (id Patient.animal.breed)
       (datatype (Complex ((l breed) (components ()))))))
     (Field
      ((path (Patient animal species)) (id Patient.animal.species)
       (datatype (Complex ((l species) (components ()))))))
     (Field
      ((path (Patient animal modifierExtension))
       (id Patient.animal.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Patient animal extension)) (id Patient.animal.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Patient animal)) (id Patient.animal)
       (datatype
        (Complex
         ((l animal)
          (components ((Scalar ((scalar_type String) (required false))))))))))
     (Field
      ((path (Patient contact period)) (id Patient.contact.period)
       (datatype (Complex ((l period) (components ()))))))
     (Field
      ((path (Patient contact organization)) (id Patient.contact.organization)
       (datatype (Complex ((l organization) (components ()))))))
     (Field
      ((path (Patient contact gender)) (id Patient.contact.gender)
       (datatype (Scalar ((scalar_type Code) (required false))))))
     (Field
      ((path (Patient contact address)) (id Patient.contact.address)
       (datatype (Complex ((l address) (components ()))))))
     (Field
      ((path (Patient contact telecom)) (id Patient.contact.telecom)
       (datatype (Complex ((l telecom) (components ()))))))
     (Field
      ((path (Patient contact name)) (id Patient.contact.name)
       (datatype (Complex ((l name) (components ()))))))
     (Field
      ((path (Patient contact relationship)) (id Patient.contact.relationship)
       (datatype (Complex ((l relationship) (components ()))))))
     (Field
      ((path (Patient contact modifierExtension))
       (id Patient.contact.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Patient contact extension)) (id Patient.contact.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Patient contact)) (id Patient.contact)
       (datatype
        (Complex
         ((l contact)
          (components ((Scalar ((scalar_type String) (required false))))))))))
     (Field
      ((path (Patient photo)) (id Patient.photo)
       (datatype (Complex ((l photo) (components ()))))))
     (Field
      ((path (Patient multipleBirth[x])) (id Patient.multipleBirth[x])
       (datatype
        (Union
         ((l2 multipleBirth[x])
          (field_types
           ((Scalar ((scalar_type Boolean) (required false)))
            (Scalar ((scalar_type Integer) (required false))))))))))
     (Field
      ((path (Patient maritalStatus)) (id Patient.maritalStatus)
       (datatype (Complex ((l maritalStatus) (components ()))))))
     (Field
      ((path (Patient address)) (id Patient.address)
       (datatype (Complex ((l address) (components ()))))))
     (Field
      ((path (Patient deceased[x])) (id Patient.deceased[x])
       (datatype
        (Union
         ((l2 deceased[x])
          (field_types
           ((Scalar ((scalar_type Boolean) (required false)))
            (Scalar ((scalar_type DateTime) (required false))))))))))
     (Field
      ((path (Patient birthDate)) (id Patient.birthDate)
       (datatype (Scalar ((scalar_type Date) (required false))))))
     (Field
      ((path (Patient gender)) (id Patient.gender)
       (datatype (Scalar ((scalar_type Code) (required false))))))
     (Field
      ((path (Patient telecom)) (id Patient.telecom)
       (datatype (Complex ((l telecom) (components ()))))))
     (Field
      ((path (Patient name)) (id Patient.name)
       (datatype (Complex ((l name) (components ()))))))
     (Field
      ((path (Patient active)) (id Patient.active)
       (datatype (Scalar ((scalar_type Boolean) (required false))))))
     (Field
      ((path (Patient identifier)) (id Patient.identifier)
       (datatype (Complex ((l identifier) (components ()))))))
     (Field
      ((path (Patient modifierExtension)) (id Patient.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Patient extension)) (id Patient.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Patient contained)) (id Patient.contained)
       (datatype (Complex ((l contained) (components ()))))))
     (Field
      ((path (Patient text)) (id Patient.text)
       (datatype (Complex ((l text) (components ()))))))
     (Field
      ((path (Patient language)) (id Patient.language)
       (datatype (Scalar ((scalar_type Code) (required false))))))
     (Field
      ((path (Patient implicitRules)) (id Patient.implicitRules)
       (datatype (Scalar ((scalar_type URI) (required false))))))
     (Field
      ((path (Patient meta)) (id Patient.meta)
       (datatype (Complex ((l meta) (components ()))))))
     (Field
      ((path (Patient id)) (id Patient.id)
       (datatype (Scalar ((scalar_type ID) (required false))))))
     (Field
      ((path (Patient link type)) (id Patient.link.type)
       (datatype (Scalar ((scalar_type Code) (required true)))))))))hello
