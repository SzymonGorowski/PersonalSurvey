// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  public enum EmploymentDataViewController {
    /// Employment data
    public static let navigationTitle = Strings.tr("Localizable", "EmploymentDataViewController.NavigationTitle", fallback: "Employment data")
    public enum CompanySizeSegmentedControlLabel {
      /// Choose company size
      public static let title = Strings.tr("Localizable", "EmploymentDataViewController.CompanySizeSegmentedControlLabel.Title", fallback: "Choose company size")
    }
    public enum ContinueButton {
      /// Continue
      public static let title = Strings.tr("Localizable", "EmploymentDataViewController.ContinueButton.Title", fallback: "Continue")
    }
    public enum EmployerNameTextField {
      /// Enter an employer name
      public static let placeholder = Strings.tr("Localizable", "EmploymentDataViewController.EmployerNameTextField.Placeholder", fallback: "Enter an employer name")
    }
    public enum JobTitleTextField {
      /// Enter your job title
      public static let placeholder = Strings.tr("Localizable", "EmploymentDataViewController.JobTitleTextField.Placeholder", fallback: "Enter your job title")
    }
    public enum TypeOfWorkSegmentedControlLabel {
      /// How do you work?
      public static let title = Strings.tr("Localizable", "EmploymentDataViewController.TypeOfWorkSegmentedControlLabel.Title", fallback: "How do you work?")
    }
  }
  public enum FinishSurveyViewController {
    /// Finish Survey
    public static let navigationTitle = Strings.tr("Localizable", "FinishSurveyViewController.NavigationTitle", fallback: "Finish Survey")
    public enum CongratsLabel {
      /// Congrats on finishing our survey 🎉. Thank you a lot you did it! It means a lot to us!
      public static let title = Strings.tr("Localizable", "FinishSurveyViewController.CongratsLabel.Title", fallback: "Congrats on finishing our survey 🎉. Thank you a lot you did it! It means a lot to us!")
    }
    public enum FinishButton {
      /// Finish
      public static let title = Strings.tr("Localizable", "FinishSurveyViewController.FinishButton.Title", fallback: "Finish")
    }
    public enum ShowSurveyMemmeButton {
      /// Show survey memme 🥹
      public static let title = Strings.tr("Localizable", "FinishSurveyViewController.ShowSurveyMemmeButton.Title", fallback: "Show survey memme 🥹")
    }
  }
  public enum MemmeViewController {
    public enum CloseButton {
      /// Close
      public static let title = Strings.tr("Localizable", "MemmeViewController.CloseButton.Title", fallback: "Close")
    }
  }
  public enum OnboardingViewController {
    public enum DescriptionLabel {
      /// Feel free to complete the survey and help us to growth. Thank you for participating in the survey.
      public static let title = Strings.tr("Localizable", "OnboardingViewController.DescriptionLabel.Title", fallback: "Feel free to complete the survey and help us to growth. Thank you for participating in the survey.")
    }
    public enum StartButton {
      /// Continue
      public static let title = Strings.tr("Localizable", "OnboardingViewController.StartButton.Title", fallback: "Continue")
    }
    public enum TitleLabel {
      /// Welcome in our Survey App
      public static let title = Strings.tr("Localizable", "OnboardingViewController.TitleLabel.Title", fallback: "Welcome in our Survey App")
    }
  }
  public enum PersonalDataViewController {
    /// Personal data
    public static let navigationTitle = Strings.tr("Localizable", "PersonalDataViewController.NavigationTitle", fallback: "Personal data")
    public enum AgePickerLabel {
      /// Pick your age:
      public static let title = Strings.tr("Localizable", "PersonalDataViewController.AgePickerLabel.Title", fallback: "Pick your age:")
    }
    public enum Alert {
      /// Ok
      public static let button = Strings.tr("Localizable", "PersonalDataViewController.Alert.Button", fallback: "Ok")
      /// Name and an email are required
      public static let message = Strings.tr("Localizable", "PersonalDataViewController.Alert.Message", fallback: "Name and an email are required")
      /// Please fill missing data
      public static let title = Strings.tr("Localizable", "PersonalDataViewController.Alert.Title", fallback: "Please fill missing data")
    }
    public enum ContinueButton {
      /// Continue
      public static let title = Strings.tr("Localizable", "PersonalDataViewController.ContinueButton.Title", fallback: "Continue")
    }
    public enum EmailTextField {
      /// Enter an email
      public static let placeholder = Strings.tr("Localizable", "PersonalDataViewController.EmailTextField.Placeholder", fallback: "Enter an email")
    }
    public enum GenderSegmentedControlLabel {
      /// Select gender:
      public static let title = Strings.tr("Localizable", "PersonalDataViewController.GenderSegmentedControlLabel.Title", fallback: "Select gender:")
    }
    public enum NameTextField {
      /// Enter a name
      public static let placeholder = Strings.tr("Localizable", "PersonalDataViewController.NameTextField.Placeholder", fallback: "Enter a name")
    }
  }
  public enum StartingViewController {
    public enum StartButton {
      /// Start the survey
      public static let title = Strings.tr("Localizable", "StartingViewController.StartButton.Title", fallback: "Start the survey")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
