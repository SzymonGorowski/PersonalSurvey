import Foundation

enum Gender: String {
    case female
    case male
    case other
}

struct UserData {
    let name: String
    let email: String
    let age: Int
    let gender: Gender
}
