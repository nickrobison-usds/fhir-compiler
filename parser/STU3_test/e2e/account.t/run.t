  $ ../../integration.exe account-stu3.json
  Registering STU3 parser
  Starting with: Account
  Account is parent? Account.id
  Is parent
  Account.id is parent? Account.meta
  Emitting:Account.id
  Account.meta is parent? Account.implicitRules
  Emitting:Account.meta
  Account.implicitRules is parent? Account.language
  Emitting:Account.implicitRules
  Account.language is parent? Account.text
  Emitting:Account.language
  Account.text is parent? Account.contained
  Emitting:Account.text
  Account.contained is parent? Account.extension
  Emitting:Account.contained
  Account.extension is parent? Account.modifierExtension
  Emitting:Account.extension
  Account.modifierExtension is parent? Account.identifier
  Emitting:Account.modifierExtension
  Account.identifier is parent? Account.status
  Emitting:Account.identifier
  Account.status is parent? Account.type
  Emitting:Account.status
  Account.type is parent? Account.name
  Emitting:Account.type
  Account.name is parent? Account.subject
  Emitting:Account.name
  Account.subject is parent? Account.period
  Emitting:Account.subject
  Account.period is parent? Account.active
  Emitting:Account.period
  Account.active is parent? Account.balance
  Emitting:Account.active
  Account.balance is parent? Account.coverage
  Emitting:Account.balance
  Account.coverage is parent? Account.coverage.id
  Is parent
  Account.coverage.id is parent? Account.coverage.extension
  Emitting:Account.coverage.id
  Account.coverage.extension is parent? Account.coverage.modifierExtension
  Emitting:Account.coverage.extension
  Account.coverage.modifierExtension is parent? Account.coverage.coverage
  Emitting:Account.coverage.modifierExtension
  Account.coverage.coverage is parent? Account.coverage.priority
  Emitting:Account.coverage.coverage
  Account.coverage.priority is parent? Account.owner
  Emitting:Account.coverage.priority
  Account.owner is parent? Account.description
  Emitting:Account.owner
  Account.description is parent? Account.guarantor
  Emitting:Account.description
  Account.guarantor is parent? Account.guarantor.id
  Is parent
  Account.guarantor.id is parent? Account.guarantor.extension
  Emitting:Account.guarantor.id
  Account.guarantor.extension is parent? Account.guarantor.modifierExtension
  Emitting:Account.guarantor.extension
  Account.guarantor.modifierExtension is parent? Account.guarantor.party
  Emitting:Account.guarantor.modifierExtension
  Account.guarantor.party is parent? Account.guarantor.onHold
  Emitting:Account.guarantor.party
  Account.guarantor.onHold is parent? Account.guarantor.period
  Emitting:Account.guarantor.onHold
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
