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
           ((Complex ((name other) (fields ())))
            (Complex ((name other) (fields ()))))))))))
     (Field
      ((path (Patient link modifierExtension))
       (id Patient.link.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Patient link extension)) (id Patient.link.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Patient link)) (id Patient.link)
       (datatype
        (Complex
         ((name link)
          (fields
           ((Field
             ((path (Patient link id)) (id Patient.link.id)
              (datatype
               (Scalar ((scalar_type (Simple String)) (required false)))))))))))))
     (Field
      ((path (Patient managingOrganization)) (id Patient.managingOrganization)
       (datatype (Complex ((name managingOrganization) (fields ()))))))
     (Field
      ((path (Patient generalPractitioner)) (id Patient.generalPractitioner)
       (datatype
        (Union
         ((l2 generalPractitioner)
          (field_types
           ((Complex ((name generalPractitioner) (fields ())))
            (Complex ((name generalPractitioner) (fields ()))))))))))
     (Field
      ((path (Patient communication preferred))
       (id Patient.communication.preferred)
       (datatype (Scalar ((scalar_type (Simple Boolean)) (required false))))))
     (Field
      ((path (Patient communication language))
       (id Patient.communication.language)
       (datatype (Complex ((name language) (fields ()))))))
     (Field
      ((path (Patient communication modifierExtension))
       (id Patient.communication.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Patient communication extension))
       (id Patient.communication.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Patient communication)) (id Patient.communication)
       (datatype
        (Complex
         ((name communication)
          (fields
           ((Field
             ((path (Patient communication id)) (id Patient.communication.id)
              (datatype
               (Scalar ((scalar_type (Simple String)) (required false)))))))))))))
     (Field
      ((path (Patient animal genderStatus)) (id Patient.animal.genderStatus)
       (datatype (Complex ((name genderStatus) (fields ()))))))
     (Field
      ((path (Patient animal breed)) (id Patient.animal.breed)
       (datatype (Complex ((name breed) (fields ()))))))
     (Field
      ((path (Patient animal species)) (id Patient.animal.species)
       (datatype (Complex ((name species) (fields ()))))))
     (Field
      ((path (Patient animal modifierExtension))
       (id Patient.animal.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Patient animal extension)) (id Patient.animal.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Patient animal)) (id Patient.animal)
       (datatype
        (Complex
         ((name animal)
          (fields
           ((Field
             ((path (Patient animal id)) (id Patient.animal.id)
              (datatype
               (Scalar ((scalar_type (Simple String)) (required false)))))))))))))
     (Field
      ((path (Patient contact period)) (id Patient.contact.period)
       (datatype (Complex ((name period) (fields ()))))))
     (Field
      ((path (Patient contact organization)) (id Patient.contact.organization)
       (datatype (Complex ((name organization) (fields ()))))))
     (Field
      ((path (Patient contact gender)) (id Patient.contact.gender)
       (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
     (Field
      ((path (Patient contact address)) (id Patient.contact.address)
       (datatype (Complex ((name address) (fields ()))))))
     (Field
      ((path (Patient contact telecom)) (id Patient.contact.telecom)
       (datatype (Complex ((name telecom) (fields ()))))))
     (Field
      ((path (Patient contact name)) (id Patient.contact.name)
       (datatype (Complex ((name name) (fields ()))))))
     (Field
      ((path (Patient contact relationship)) (id Patient.contact.relationship)
       (datatype (Complex ((name relationship) (fields ()))))))
     (Field
      ((path (Patient contact modifierExtension))
       (id Patient.contact.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Patient contact extension)) (id Patient.contact.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Patient contact)) (id Patient.contact)
       (datatype
        (Complex
         ((name contact)
          (fields
           ((Field
             ((path (Patient contact id)) (id Patient.contact.id)
              (datatype
               (Scalar ((scalar_type (Simple String)) (required false)))))))))))))
     (Field
      ((path (Patient photo)) (id Patient.photo)
       (datatype (Complex ((name photo) (fields ()))))))
     (Field
      ((path (Patient multipleBirth[x])) (id Patient.multipleBirth[x])
       (datatype
        (Union
         ((l2 multipleBirth[x])
          (field_types
           ((Scalar ((scalar_type (Simple Boolean)) (required false)))
            (Scalar ((scalar_type (Simple Integer)) (required false))))))))))
     (Field
      ((path (Patient maritalStatus)) (id Patient.maritalStatus)
       (datatype (Complex ((name maritalStatus) (fields ()))))))
     (Field
      ((path (Patient address)) (id Patient.address)
       (datatype (Complex ((name address) (fields ()))))))
     (Field
      ((path (Patient deceased[x])) (id Patient.deceased[x])
       (datatype
        (Union
         ((l2 deceased[x])
          (field_types
           ((Scalar ((scalar_type (Simple Boolean)) (required false)))
            (Scalar ((scalar_type (Simple DateTime)) (required false))))))))))
     (Field
      ((path (Patient birthDate)) (id Patient.birthDate)
       (datatype (Scalar ((scalar_type (Simple Date)) (required false))))))
     (Field
      ((path (Patient gender)) (id Patient.gender)
       (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
     (Field
      ((path (Patient telecom)) (id Patient.telecom)
       (datatype (Complex ((name telecom) (fields ()))))))
     (Field
      ((path (Patient name)) (id Patient.name)
       (datatype (Complex ((name name) (fields ()))))))
     (Field
      ((path (Patient active)) (id Patient.active)
       (datatype (Scalar ((scalar_type (Simple Boolean)) (required false))))))
     (Field
      ((path (Patient identifier)) (id Patient.identifier)
       (datatype (Complex ((name identifier) (fields ()))))))
     (Field
      ((path (Patient modifierExtension)) (id Patient.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Patient extension)) (id Patient.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Patient contained)) (id Patient.contained)
       (datatype (Complex ((name contained) (fields ()))))))
     (Field
      ((path (Patient text)) (id Patient.text)
       (datatype (Complex ((name text) (fields ()))))))
     (Field
      ((path (Patient language)) (id Patient.language)
       (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
     (Field
      ((path (Patient implicitRules)) (id Patient.implicitRules)
       (datatype (Scalar ((scalar_type (Simple URI)) (required false))))))
     (Field
      ((path (Patient meta)) (id Patient.meta)
       (datatype (Complex ((name meta) (fields ()))))))
     (Field
      ((path (Patient id)) (id Patient.id)
       (datatype (Scalar ((scalar_type (Simple ID)) (required false))))))
     (Field
      ((path (Patient link type)) (id Patient.link.type)
       (datatype (Scalar ((scalar_type (Simple Code)) (required true)))))))))hello
