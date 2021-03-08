// Eric Wasserman
//
import Foundation
// Use darwin to be able to exit the program
import Darwin

class Program{
    init(){
        /* This is where I would read the file. I would then iterate through the file and encrypt each password, then save each key / value to a dictionary. I couldn't get the file reading to work correctly so I have some test passwords hard coded below. */
        
        // These passwords are hardcoded so you can see the implementation of my project.
        var dictionary: [String:String] =
            ["Twitter": "Password3",
             "Facebook": "Password01",
             "Instagram": "Password"]
        
        var reply = ""
        var reply1 = ""
        var keepRunning = true
        var passwords = ""
        var deletes = ""
        var onePassword=""
        
        
        
        while keepRunning{
            var menu = true
            // Ask user what command they would like to use
            while menu{
                reply1 = Ask.askQuestion(questionText: "Would you like to 1. View all password names? 2. View a single password? 3. Delete a password? 4. Create a new password?", accetpableReplies: ["1","2","3","4"])
                if(reply1 == "1")
                {
                    // Decrypt here
                    print(Edit.readAllPasswords(dictionary: dictionary))
                }
                else if(reply1 == "2")
                {
                    // Decrypt here
                    onePassword = Edit.readSinglePassword(dictionary: dictionary)
                    print(onePassword)

                }
                else if(reply1 == "3")
                {
                    // Decrypt password
                    dictionary = Edit.deletePassword(dictionary: dictionary)
                }
                else if(reply1 == "4")
                {
                    dictionary = Edit.newPassword(dictionary: dictionary)
                    // Encrypt before storing new password
                }
                else
                {
                    print("Invalid Input")
                }
                
                reply = Ask.askQuestion(questionText: "Do you want to keep running the app? (yes/no)", accetpableReplies: ["yes","no"])
                
                if(reply == "yes"){
                    continue
                }
                else if(reply == "no"){
                    exit(0)
                }
                else{
                    print("Invalid Input")
                }
                
            }
        }
    }
}

let p = Program()

class Ask
{
    static func askQuestion(questionText output: String,accetpableReplies inputArr: [String], caseSensitive: Bool = false) -> String
    {
        print(output) // out question
        
        //handle response
        guard let response = readLine() else
        {
            print("Invalid Input")
            return askQuestion(questionText: output, accetpableReplies: inputArr)
        }
        //verify that the response is acceptable
        //or that we dont care what the response is
        if(inputArr.contains(response)||inputArr.isEmpty)
        {
            return response
        }
        else
        {
            print("Invalid Input")
            return askQuestion(questionText: output, accetpableReplies: inputArr)
        }
    }
}

class Edit
{
    // Read all passwords
    static func readAllPasswords(dictionary: [String:String]) -> [String:String]{
        return dictionary
    }
    
    static func newPassword(dictionary: [String:String]) -> [String:String]{
        var reply3 = " "
        var reply4 = ""
        var dictionary = dictionary
        reply3 = Ask.askQuestion(questionText: "What password would you like to add?", accetpableReplies: ["Snapchat","Tinder"])
        reply4 = Ask.askQuestion(questionText: "Password:", accetpableReplies: ["Password123456","Password12345"])
        dictionary[reply3] = reply4
        return dictionary
    }
    
    // Read single password
    static func readSinglePassword(dictionary: [String:String]) -> String{
        var reply1 = " "
        reply1 = Ask.askQuestion(questionText: "What password would you like to view?", accetpableReplies: ["Twitter","Facebook","Instagran"])
        for (key, value) in dictionary {
            if(reply1 == key){
                return value
            }
        }
        return "Invalid Key"
    }
    
    // delete password
    static func deletePassword(dictionary: [String:String]) -> [String:String]{
        var reply2 = " "
        var dictionary = dictionary
        reply2 = Ask.askQuestion(questionText: "What password would you like to delete?", accetpableReplies: ["Twitter","Facebook","Instagram"])
        for (key, value) in dictionary {
            if(reply2 == key){
                // delete key and value
                dictionary.removeValue(forKey: key)
                return dictionary
            }
        }
        print("Invalid Input")
        return dictionary
    }
}


class Encrypt{
    func translate(l: Character, trans: Int) -> Character
    {
        if let ascii = l.asciiValue
        {
            var outputInt = ascii
            if ascii >= 97 && ascii <= 122
            {
                outputInt = ((ascii-97+UInt8(trans))%26)+97
            }
            else if ((ascii >= 65) && ascii <= 90)
            {
                outputInt = ((ascii-65+UInt8(trans))%26)+65
            }
            return Character(UnicodeScalar(outputInt))
        }
        
        return Character("")
    }
}


 /*
 class Decrypt{
     var string3 = "ericwasserman"
     var strShift = ""
     var shift = string3.count

     for letter in string3{
         shrShift += String(translate(1: letter, trans:shift))
     }
     print(strShift)

     func translate(1: Character, trans: Int) -> Character
     {
         if let ascii = 1.asciiValue
         {
             var outputInt = ascii
             if ascii >= 97 && ascii <= 122
             {
                 outputInt = ((ascii-97 + UInt8(trans))%26)+97
             }
             else if ((ascii >= 65) && ascii <= 90)
             {
                 outputInt = ((ascii-65+UInt8(trans))%26)+65
             }
             return Character(outputInt)
         }
     }
 }
  
 
*/
