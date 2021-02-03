  $ ../../integration.exe codesystem-account-status-stu3.json
  (CodeSystem
   ((name AccountStatus) (valueset http://hl7.org/fhir/ValueSet/account-status)
    (description "Indicates whether the account is available to be used.")
    (content Complete)
    (concept
     (((code active) (display Active)
       (description "This account is active and may be used."))
      ((code inactive) (display Inactive)
       (description
        "This account is inactive and should not be used to track financial information."))
      ((code entered-in-error) (display "Entered in error")
       (description
        "This instance should not have been part of this patient's medical record."))))))
