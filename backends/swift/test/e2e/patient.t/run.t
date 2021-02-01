  $ ../../integration.exe patient_optional
  import Foundation
  
  
   class Patient {
  public var Name: String?
  
  init (){
  
  }}
  $ ../../integration.exe patient_required
  import Foundation
  
  
   class Patient {
  public var Name: String
  
  init (Name: String){
  self.Name=Name
  }}
  $ ../../integration.exe patient_arity_optional
  import Foundation
  
  
   class Patient {
  public var Id: [String]?
                  
  public var Name: String
  
  init (Name: String){
  self.Name=Name
  }}
  $ ../../integration.exe patient_arity_required
  import Foundation
  
  
   class Patient {
  public var Id: [String]
                  
  public var Name: String
  
  init (Id: [String], Name: String){
  self.Id=Id
  self.Name=Name
  }}
