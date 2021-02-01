  $ ../../integration.exe account-stu3.json
  Registering STU3 parser
  ((name Account)
   (fields
    ((Field
      ((path (Account guarantor onHold)) (id Account.guarantor.onHold)
       (datatype (Scalar ((scalar_type (Simple Boolean)) (required false))))))
     (Field
      ((path (Account guarantor party)) (id Account.guarantor.party)
       (datatype
        (Union
         ((l2 party)
          (field_types
           ((Complex ((name party) (fields ())))
            (Complex ((name party) (fields ())))
            (Complex ((name party) (fields ()))))))))))
     (Field
      ((path (Account guarantor modifierExtension))
       (id Account.guarantor.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Account guarantor extension)) (id Account.guarantor.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Account guarantor)) (id Account.guarantor)
       (datatype
        (Complex
         ((name guarantor)
          (fields
           ((Field
             ((path (Account guarantor id)) (id Account.guarantor.id)
              (datatype
               (Scalar ((scalar_type (Simple String)) (required false)))))))))))))
     (Field
      ((path (Account description)) (id Account.description)
       (datatype (Scalar ((scalar_type (Simple String)) (required false))))))
     (Field
      ((path (Account owner)) (id Account.owner)
       (datatype (Complex ((name owner) (fields ()))))))
     (Field
      ((path (Account coverage priority)) (id Account.coverage.priority)
       (datatype
        (Scalar ((scalar_type (Simple PositiveInt)) (required false))))))
     (Field
      ((path (Account coverage coverage)) (id Account.coverage.coverage)
       (datatype (Complex ((name coverage) (fields ()))))))
     (Field
      ((path (Account coverage modifierExtension))
       (id Account.coverage.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Account coverage extension)) (id Account.coverage.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Account coverage)) (id Account.coverage)
       (datatype
        (Complex
         ((name coverage)
          (fields
           ((Field
             ((path (Account coverage id)) (id Account.coverage.id)
              (datatype
               (Scalar ((scalar_type (Simple String)) (required false)))))))))))))
     (Field
      ((path (Account balance)) (id Account.balance)
       (datatype (Complex ((name balance) (fields ()))))))
     (Field
      ((path (Account active)) (id Account.active)
       (datatype (Complex ((name active) (fields ()))))))
     (Field
      ((path (Account period)) (id Account.period)
       (datatype (Complex ((name period) (fields ()))))))
     (Field
      ((path (Account subject)) (id Account.subject)
       (datatype
        (Union
         ((l2 subject)
          (field_types
           ((Complex ((name subject) (fields ())))
            (Complex ((name subject) (fields ())))
            (Complex ((name subject) (fields ())))
            (Complex ((name subject) (fields ())))
            (Complex ((name subject) (fields ())))
            (Complex ((name subject) (fields ()))))))))))
     (Field
      ((path (Account name)) (id Account.name)
       (datatype (Scalar ((scalar_type (Simple String)) (required false))))))
     (Field
      ((path (Account type)) (id Account.type)
       (datatype (Complex ((name type) (fields ()))))))
     (Field
      ((path (Account status)) (id Account.status)
       (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
     (Field
      ((path (Account identifier)) (id Account.identifier)
       (datatype (Complex ((name identifier) (fields ()))))))
     (Field
      ((path (Account modifierExtension)) (id Account.modifierExtension)
       (datatype (Complex ((name modifierExtension) (fields ()))))))
     (Field
      ((path (Account extension)) (id Account.extension)
       (datatype (Complex ((name extension) (fields ()))))))
     (Field
      ((path (Account contained)) (id Account.contained)
       (datatype (Complex ((name contained) (fields ()))))))
     (Field
      ((path (Account text)) (id Account.text)
       (datatype (Complex ((name text) (fields ()))))))
     (Field
      ((path (Account language)) (id Account.language)
       (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
     (Field
      ((path (Account implicitRules)) (id Account.implicitRules)
       (datatype (Scalar ((scalar_type (Simple URI)) (required false))))))
     (Field
      ((path (Account meta)) (id Account.meta)
       (datatype (Complex ((name meta) (fields ()))))))
     (Field
      ((path (Account id)) (id Account.id)
       (datatype (Scalar ((scalar_type (Simple ID)) (required false))))))
     (Field
      ((path (Account guarantor period)) (id Account.guarantor.period)
       (datatype (Complex ((name period) (fields ())))))))))hello
