/* Need to change this to make it in scope of my project. */

import Foundation

var dictionary: [String:String] =
    ["Twitter": "Password3",
     "Facebook": "Password01",
     "Instagram": "Password"]

func createFile(){
    do{
        let fileURL = try FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        .appendingPathComponent("mybadpasswords.json")

    try JSONSerialization.data(withJSONObject: dictionary)
        .write(to: fileURL)
    } catch{
        print(error)
    }

    do{
        let fileURL = try FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("mybadpasswords.json")

        let data = try Data(contentsOf: fileURL)
        let dictionary = try JSONSerialization.jsonObject(with: data)
    } catch{
        print(error)
    }
}

let cf = createFile()
