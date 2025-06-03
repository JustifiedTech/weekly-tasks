import UIKit


enum AccountType{
    case savings
    case current
}

class Account {
var accountBalance:Int
var customerId: Int
let id:Int
    var interestRate:Double{
        return 0.0
    }
    
    
    init(accountBalance:Int,
         customerId: Int,
         id:Int
    
    ){
        self.accountBalance = accountBalance
        self.customerId = customerId;
        self.id = id
//        self.interestRate = interestRate
    }
    
    
func withdrawal(amount:Int) -> String {
    
    if(accountBalance < amount || accountBalance == 0){
        return "Withdrawal unsuccessful due to insufficient fund, try deposit."
    }
    accountBalance -= amount
    return String(accountBalance)
    
}
    func deposit(amount:Int) -> String {
        
        accountBalance += amount
        return String(accountBalance)
        
    }
    
    func charge()->String{
        
        accountBalance  -= 10000
        
        return String(accountBalance)
    }
    
    func bonus()->String{
        accountBalance  += 1000
        return String(accountBalance)
    }
    
}


class SavingsAccount:Account{
    override var interestRate: Double{
        0.1
    }
    override func deposit(amount: Int) -> String {
        accountBalance += amount
        bonus()
        return String(accountBalance)
    }
}

class CurrentAccount:Account {

    override var interestRate: Double {
        0.05
        
    }
    override func withdrawal(amount: Int) -> String {
        if (accountBalance - Int(charge())!) < amount {
            return "Withdrawal unsuccessful due to insufficient fund in your current account, try deposit."
        }
         accountBalance   -= amount
        charge()
        return String(accountBalance)
        
    }
}

class Customer{
    private var id:Int
    private var name:String
    private var address:String
    private var phoneNumber:String
    private var accounts:[Account]?
    
    var pubId : Int {
        get { return id}
        
        set { id = newValue }
    }

    var pubName: String {
        get { return name}
    
        set { name = newValue }
    }
    
    var pubddress: String {
        get {  return address }
        
        set { address = newValue}
    }
    
    var pubPhoneNumber: String {
        get {  return phoneNumber }
        
        set { phoneNumber = newValue }
    }
    var pubAccounts: [Account]? {
        get {  return accounts }
        
        set { accounts = newValue }
    }
    
    
    init(id:Int, name:String, address:String, phoneNumber:String, accounts:[Account]?)
    {
        self.id = id;
        self.name = name;
        self.address = address;
        self.phoneNumber = phoneNumber
        self.accounts = accounts
        
    }
    
    func accountBalance(account:Account)-> String {
        let balance :Int = account.accountBalance
        return String(balance);
    }
    
    func withdrawal(account:Account, amount:Int)->String{
        
        return account.accountBalance >= 0 ? account.withdrawal(amount: amount) : "Insufficient fund"
        
    }
    
    func deposit(account:Account, amount:Int)->String{
        
        return account.deposit(amount: amount)
    }
    
    
    func openAccount(accountType: AccountType)->[Account]{
        
        
        switch accountType{
            case .savings:
            let newAccount = SavingsAccount(accountBalance: 30000, customerId: id, id: Int.random(in: 1...5))
            if accounts != nil{
         accounts!.append(newAccount)
            }
            
            case .current:
            let newAccount =  CurrentAccount(accountBalance: 30000, customerId: id, id: Int.random(in: 6...10))
            
            if accounts != nil {
             accounts!.append(newAccount)
            }
             }
    
        if let myaccounts = accounts {
            return myaccounts
        }else{
            return []
        }
        
           }
    
    func closeAccount(account:Account)->[Account]{
        if  accounts != nil{
            
            accounts!.removeAll {
                $0.id == account.id
            }
        }
        
        if let myaccounts = accounts {
            return myaccounts
        }else{
            return []
        }
    }
}


var savings = SavingsAccount(accountBalance: 30000, customerId: 1, id: Int.random(in: 1...5))
var current = CurrentAccount(accountBalance: 30000, customerId: 1, id: Int.random(in: 6...10))
var customer =  Customer(id:3, name: "Kelechi", address: "decagon institute", phoneNumber: "07037837788", accounts:[])


let createSavingsAccount = customer.openAccount(accountType: .savings);

print("savings account balance in naira N\((createSavingsAccount[0].accountBalance)/100)")
print("Customer Id: \(createSavingsAccount[0].customerId)")
print("Account Id: \(createSavingsAccount[0].id)")
print("savings account balance after withdrawal in naira N\(Int(createSavingsAccount[0].withdrawal(amount: 10000))!/100)")


let createCurrentAccount = customer.openAccount(accountType: .current);

print("current account balance in naira N\((createCurrentAccount[1].accountBalance)/100)")
print("Customer Id: \(createCurrentAccount[1].customerId)")
print("Account Id: \(createCurrentAccount[1].id)")
print("current account balance after withdrawal in naira N\(Int(createCurrentAccount[1].withdrawal(amount: 10000))!/100)")

customer.closeAccount(account: createCurrentAccount[1])

print(customer.pubAccounts!)



//  Polymorphism
// Polymorphism is the ability of child object (sub classes) to keep their methods separate from other sub classes and also the parent class providing the ability for an inherited property or method act according to requirements of its base object
// polymorphism was used in both the current and savings account objects by the following
// 1. Overriding of the the interest rate and deposit methods to define how it works in respect to a savings account
// 2. Overriding of the the interest rate and withdrawal methods to define how it works in respect to a current account


//  Abstraction
//Abstraction is an extension of encapsulation. It is the process of extracting only context relevant data from a pull of data. i.e making use of data that are only needed in a context by grouping data according to their use and interdependency
// The concept of abstraction was implemented by creation of different classes and keeping only informations related to the class on it.
// Account class holds all information relating to an account such as id, account balance etc. while keeping customer related data  such as name, accounts operated by the customers in the customer class etc.



//  Inheritance
// Inheritance is the ability of one object to acquire some/all properties of another object.
// In this task the concept of inheritance was utilized as can be seen above
// Both the Savings and Current account objects inherited their properties from their parent Account object.


// Encapsulation
// Encapsulation is accomplished when each object maintains a private state, inside a class. Other objects can not access this state directly, instead, they can only invoke a list of public methods. The object manages its own state through these methods and no other class can alter it unless explicitly allowed.
// This can be seen in the customer class, all of its (id, name, address, phoneNumber and accounts) properties are private and can only be gotten from stated properties using the  custom getter and setter method




class PlayAround{
   private var points:Int
   private var name:String
    
    init(name:String, points:Int) {
        
        self.name = name
        self.points = points
    }
    
    var userName: String {
        get {  return name.capitalized }
        
        set { name = newValue}
    }
    
    var userPoint: Int {
        return points * 4 
        
//        set { points = newValue/5 }
    }

}

let play = PlayAround(name: "Player", points: 20)

//print(play.name)
print(play.userName)
print(play.userName = "Another")
//print(play.name)
print(play.userName)
//print(play.points)
print(play.userPoint)
//print(play.userPoint = 200)
//print(play.points)
print(play.userPoint)






