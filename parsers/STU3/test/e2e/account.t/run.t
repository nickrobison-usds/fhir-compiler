  $ ../../integration.exe account-stu3.json
  Registering STU3 parser
  ((name Account)
   (fields
    ((Field
      ((path (Account guarantor onHold)) (id Account.guarantor.onHold)
       (datatype (Scalar ((scalar_type Boolean) (required false))))))
     (Field
      ((path (Account guarantor party)) (id Account.guarantor.party)
       (datatype
        (Union
         ((l2 party)
          (field_types
           ((Complex ((l party) (components ())))
            (Complex ((l party) (components ())))
            (Complex ((l party) (components ()))))))))))
     (Field
      ((path (Account guarantor modifierExtension))
       (id Account.guarantor.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Account guarantor extension)) (id Account.guarantor.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Account guarantor)) (id Account.guarantor)
       (datatype
        (Complex
         ((l guarantor)
          (components ((Scalar ((scalar_type String) (required false))))))))))
     (Field
      ((path (Account description)) (id Account.description)
       (datatype (Scalar ((scalar_type String) (required false))))))
     (Field
      ((path (Account owner)) (id Account.owner)
       (datatype (Complex ((l owner) (components ()))))))
     (Field
      ((path (Account coverage priority)) (id Account.coverage.priority)
       (datatype (Scalar ((scalar_type PositiveInt) (required false))))))
     (Field
      ((path (Account coverage coverage)) (id Account.coverage.coverage)
       (datatype (Complex ((l coverage) (components ()))))))
     (Field
      ((path (Account coverage modifierExtension))
       (id Account.coverage.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Account coverage extension)) (id Account.coverage.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Account coverage)) (id Account.coverage)
       (datatype
        (Complex
         ((l coverage)
          (components ((Scalar ((scalar_type String) (required false))))))))))
     (Field
      ((path (Account balance)) (id Account.balance)
       (datatype (Complex ((l balance) (components ()))))))
     (Field
      ((path (Account active)) (id Account.active)
       (datatype (Complex ((l active) (components ()))))))
     (Field
      ((path (Account period)) (id Account.period)
       (datatype (Complex ((l period) (components ()))))))
     (Field
      ((path (Account subject)) (id Account.subject)
       (datatype
        (Union
         ((l2 subject)
          (field_types
           ((Complex ((l subject) (components ())))
            (Complex ((l subject) (components ())))
            (Complex ((l subject) (components ())))
            (Complex ((l subject) (components ())))
            (Complex ((l subject) (components ())))
            (Complex ((l subject) (components ()))))))))))
     (Field
      ((path (Account name)) (id Account.name)
       (datatype (Scalar ((scalar_type String) (required false))))))
     (Field
      ((path (Account type)) (id Account.type)
       (datatype (Complex ((l type) (components ()))))))
     (Field
      ((path (Account status)) (id Account.status)
       (datatype (Scalar ((scalar_type Code) (required false))))))
     (Field
      ((path (Account identifier)) (id Account.identifier)
       (datatype (Complex ((l identifier) (components ()))))))
     (Field
      ((path (Account modifierExtension)) (id Account.modifierExtension)
       (datatype (Complex ((l modifierExtension) (components ()))))))
     (Field
      ((path (Account extension)) (id Account.extension)
       (datatype (Complex ((l extension) (components ()))))))
     (Field
      ((path (Account contained)) (id Account.contained)
       (datatype (Complex ((l contained) (components ()))))))
     (Field
      ((path (Account text)) (id Account.text)
       (datatype (Complex ((l text) (components ()))))))
     (Field
      ((path (Account language)) (id Account.language)
       (datatype (Scalar ((scalar_type Code) (required false))))))
     (Field
      ((path (Account implicitRules)) (id Account.implicitRules)
       (datatype (Scalar ((scalar_type URI) (required false))))))
     (Field
      ((path (Account meta)) (id Account.meta)
       (datatype (Complex ((l meta) (components ()))))))
     (Field
      ((path (Account id)) (id Account.id)
       (datatype (Scalar ((scalar_type ID) (required false))))))
     (Field
      ((path (Account guarantor period)) (id Account.guarantor.period)
       (datatype (Complex ((l period) (components ())))))))))hello
