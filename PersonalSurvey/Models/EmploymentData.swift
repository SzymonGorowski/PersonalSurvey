import Foundation

struct EmploymentData {
    enum CompanySize {
        case small
        case medium
        case large
        
        var displayTitle: String {
            switch self {
            case .small:
                return "1-99"
            case .medium:
                return "100-499"
            case .large:
                return "500+"
            }
        }
    }
    
    enum TypeOfWork: String {
        case office
        case hybrid
        case remotely
    }
    
    let employerName: String
    let jobTitle: String
    let companySize: CompanySize
    let typeOfWork: TypeOfWork
}
