  $ ../../integration.exe account
  import Foundation
  
  
   class Account {
  public var Description: String?
  public var Owner: Reference?
                  
  public var Coverage: AccountCoverage?
                  
  public var Balance: Money?
  public var Active: Period?
                  
  public var Period: Period?
  public var Subject: Reference?
                  
  public var Name: String?
  public var Type: CodeableConcept?
                  
  public var Status: String?
                  
  public var Identifier: [String]?
  
  init (){
  
  }}
  
   class AccountCoverage {
  public var Priority: Int?
                          
  public var Coverage: Reference
  
  init (Coverage: Reference){
  self.Coverage=Coverage
  }}
