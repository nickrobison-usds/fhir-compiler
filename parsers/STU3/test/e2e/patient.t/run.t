  $ ../../integration.exe patient-stu3.json
  Registering STU3 parser
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
