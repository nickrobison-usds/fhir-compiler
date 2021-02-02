  $ ../../integration.exe patient-stu3.json
  (Structure
   ((name Patient)
    (fields
     ((Field
       ((path (Patient link other)) (id Patient.link.other)
        (datatype
         (Union
          ((l2 other)
           (field_types
            ((Scalar ((scalar_type (Complex Reference)) (required true)))
             (Scalar ((scalar_type (Complex Reference)) (required true))))))))))
      (Field
       ((path (Patient link modifierExtension))
        (id Patient.link.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Patient link extension)) (id Patient.link.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
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
        (datatype
         (Scalar ((scalar_type (Complex Reference)) (required false))))))
      (Field
       ((path (Patient generalPractitioner)) (id Patient.generalPractitioner)
        (datatype
         (Union
          ((l2 generalPractitioner)
           (field_types
            ((Arity
              ((l3 generalPractitioner) (min 0) (max *)
               (ft2 (Complex Reference))))
             (Arity
              ((l3 generalPractitioner) (min 0) (max *)
               (ft2 (Complex Reference)))))))))))
      (Field
       ((path (Patient communication preferred))
        (id Patient.communication.preferred)
        (datatype (Scalar ((scalar_type (Simple Boolean)) (required false))))))
      (Field
       ((path (Patient communication language))
        (id Patient.communication.language)
        (datatype (Scalar ((scalar_type (Complex Signature)) (required true))))))
      (Field
       ((path (Patient communication modifierExtension))
        (id Patient.communication.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Patient communication extension))
        (id Patient.communication.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
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
        (datatype
         (Scalar ((scalar_type (Complex Signature)) (required false))))))
      (Field
       ((path (Patient animal breed)) (id Patient.animal.breed)
        (datatype
         (Scalar ((scalar_type (Complex Signature)) (required false))))))
      (Field
       ((path (Patient animal species)) (id Patient.animal.species)
        (datatype (Scalar ((scalar_type (Complex Signature)) (required true))))))
      (Field
       ((path (Patient animal modifierExtension))
        (id Patient.animal.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Patient animal extension)) (id Patient.animal.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
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
        (datatype (Scalar ((scalar_type (Complex Period)) (required false))))))
      (Field
       ((path (Patient contact organization)) (id Patient.contact.organization)
        (datatype
         (Scalar ((scalar_type (Complex Reference)) (required false))))))
      (Field
       ((path (Patient contact gender)) (id Patient.contact.gender)
        (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
      (Field
       ((path (Patient contact address)) (id Patient.contact.address)
        (datatype (Scalar ((scalar_type (Complex Address)) (required false))))))
      (Field
       ((path (Patient contact telecom)) (id Patient.contact.telecom)
        (datatype
         (Arity ((l3 telecom) (min 0) (max *) (ft2 (Complex ContactPoint)))))))
      (Field
       ((path (Patient contact name)) (id Patient.contact.name)
        (datatype
         (Scalar ((scalar_type (Complex HumanName)) (required false))))))
      (Field
       ((path (Patient contact relationship)) (id Patient.contact.relationship)
        (datatype
         (Arity ((l3 relationship) (min 0) (max *) (ft2 (Complex Signature)))))))
      (Field
       ((path (Patient contact modifierExtension))
        (id Patient.contact.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Patient contact extension)) (id Patient.contact.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
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
        (datatype
         (Arity ((l3 photo) (min 0) (max *) (ft2 (Complex Attachment)))))))
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
        (datatype
         (Scalar ((scalar_type (Complex Signature)) (required false))))))
      (Field
       ((path (Patient address)) (id Patient.address)
        (datatype
         (Arity ((l3 address) (min 0) (max *) (ft2 (Complex Address)))))))
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
        (datatype
         (Arity ((l3 telecom) (min 0) (max *) (ft2 (Complex ContactPoint)))))))
      (Field
       ((path (Patient name)) (id Patient.name)
        (datatype
         (Arity ((l3 name) (min 0) (max *) (ft2 (Complex HumanName)))))))
      (Field
       ((path (Patient active)) (id Patient.active)
        (datatype (Scalar ((scalar_type (Simple Boolean)) (required false))))))
      (Field
       ((path (Patient identifier)) (id Patient.identifier)
        (datatype
         (Arity ((l3 identifier) (min 0) (max *) (ft2 (Complex Identifier)))))))
      (Field
       ((path (Patient modifierExtension)) (id Patient.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Patient extension)) (id Patient.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Patient contained)) (id Patient.contained)
        (datatype
         (Arity ((l3 contained) (min 0) (max *) (ft2 (Domain Resource)))))))
      (Field
       ((path (Patient text)) (id Patient.text)
        (datatype (Scalar ((scalar_type (Domain Narrative)) (required false))))))
      (Field
       ((path (Patient language)) (id Patient.language)
        (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
      (Field
       ((path (Patient implicitRules)) (id Patient.implicitRules)
        (datatype (Scalar ((scalar_type (Simple URI)) (required false))))))
      (Field
       ((path (Patient meta)) (id Patient.meta)
        (datatype (Scalar ((scalar_type (Domain Meta)) (required false))))))
      (Field
       ((path (Patient id)) (id Patient.id)
        (datatype (Scalar ((scalar_type (Simple ID)) (required false))))))
      (Field
       ((path (Patient link type)) (id Patient.link.type)
        (datatype (Scalar ((scalar_type (Simple Code)) (required true))))))))))hello
