  $ ../../integration.exe account-stu3.json
  (Structure
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
            ((Scalar ((scalar_type (Complex Reference)) (required true)))
             (Scalar ((scalar_type (Complex Reference)) (required true)))
             (Scalar ((scalar_type (Complex Reference)) (required true))))))))))
      (Field
       ((path (Account guarantor modifierExtension))
        (id Account.guarantor.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Account guarantor extension)) (id Account.guarantor.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
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
        (datatype
         (Scalar ((scalar_type (Complex Reference)) (required false))))))
      (Field
       ((path (Account coverage priority)) (id Account.coverage.priority)
        (datatype
         (Scalar ((scalar_type (Simple PositiveInt)) (required false))))))
      (Field
       ((path (Account coverage coverage)) (id Account.coverage.coverage)
        (datatype (Scalar ((scalar_type (Complex Reference)) (required true))))))
      (Field
       ((path (Account coverage modifierExtension))
        (id Account.coverage.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Account coverage extension)) (id Account.coverage.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
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
        (datatype (Scalar ((scalar_type (Complex Money)) (required false))))))
      (Field
       ((path (Account active)) (id Account.active)
        (datatype (Scalar ((scalar_type (Complex Period)) (required false))))))
      (Field
       ((path (Account period)) (id Account.period)
        (datatype (Scalar ((scalar_type (Complex Period)) (required false))))))
      (Field
       ((path (Account subject)) (id Account.subject)
        (datatype
         (Union
          ((l2 subject)
           (field_types
            ((Scalar ((scalar_type (Complex Reference)) (required false)))
             (Scalar ((scalar_type (Complex Reference)) (required false)))
             (Scalar ((scalar_type (Complex Reference)) (required false)))
             (Scalar ((scalar_type (Complex Reference)) (required false)))
             (Scalar ((scalar_type (Complex Reference)) (required false)))
             (Scalar ((scalar_type (Complex Reference)) (required false))))))))))
      (Field
       ((path (Account name)) (id Account.name)
        (datatype (Scalar ((scalar_type (Simple String)) (required false))))))
      (Field
       ((path (Account type)) (id Account.type)
        (datatype
         (Scalar ((scalar_type (Complex Signature)) (required false))))))
      (Field
       ((path (Account status)) (id Account.status)
        (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
      (Field
       ((path (Account identifier)) (id Account.identifier)
        (datatype
         (Arity ((l3 identifier) (min 0) (max *) (ft2 (Complex Identifier)))))))
      (Field
       ((path (Account modifierExtension)) (id Account.modifierExtension)
        (datatype
         (Arity
          ((l3 modifierExtension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Account extension)) (id Account.extension)
        (datatype
         (Arity ((l3 extension) (min 0) (max *) (ft2 (Domain Extension)))))))
      (Field
       ((path (Account contained)) (id Account.contained)
        (datatype
         (Arity ((l3 contained) (min 0) (max *) (ft2 (Domain Resource)))))))
      (Field
       ((path (Account text)) (id Account.text)
        (datatype (Scalar ((scalar_type (Domain Narrative)) (required false))))))
      (Field
       ((path (Account language)) (id Account.language)
        (datatype (Scalar ((scalar_type (Simple Code)) (required false))))))
      (Field
       ((path (Account implicitRules)) (id Account.implicitRules)
        (datatype (Scalar ((scalar_type (Simple URI)) (required false))))))
      (Field
       ((path (Account meta)) (id Account.meta)
        (datatype (Scalar ((scalar_type (Domain Meta)) (required false))))))
      (Field
       ((path (Account id)) (id Account.id)
        (datatype (Scalar ((scalar_type (Simple ID)) (required false))))))
      (Field
       ((path (Account guarantor period)) (id Account.guarantor.period)
        (datatype (Scalar ((scalar_type (Complex Period)) (required false))))))))))
