import Foundation
import Combine

final class EmploymentDataViewModel {
    let typesOfWork = [
        EmploymentData.TypeOfWork.office.rawValue,
        EmploymentData.TypeOfWork.hybrid.rawValue,
        EmploymentData.TypeOfWork.remotely.rawValue
    ]
    
    let companySizes = [
        EmploymentData.CompanySize.small.displayTitle,
        EmploymentData.CompanySize.medium.displayTitle,
        EmploymentData.CompanySize.large.displayTitle
    ]
    
    var employerName = CurrentValueSubject<String, Never>("")
    var jobTitle = CurrentValueSubject<String, Never>("")
    var typeOfWork = CurrentValueSubject<EmploymentData.TypeOfWork, Never>(.office)
    var companySize = CurrentValueSubject<EmploymentData.CompanySize, Never>(.small)
}
