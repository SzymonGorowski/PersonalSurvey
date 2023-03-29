import Foundation
import Combine

final class PersonalDataViewModel {
    let ageRange = Array(18...120)
    var name = CurrentValueSubject<String, Never>("")
    var email = CurrentValueSubject<String, Never>("")
    var age = CurrentValueSubject<Int, Never>(18)
    var gender = CurrentValueSubject<Gender, Never>(.female)
}
