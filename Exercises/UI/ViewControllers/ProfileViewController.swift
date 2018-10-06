
import UIKit
import HealthKit

class ProfileViewController: UITableViewController {
    
  private enum ProfileSection: Int {
    case ageSexBloodType
    case weightHeightBMI
    case authorizeHealthKit
    case saveBMI
  }
  
  private enum ProfileDataError: Error {
    
    case missingBodyMassIndex
    
    var localizedDescription: String {
      switch self {
      case .missingBodyMassIndex:
        return "Unable to calculate body mass index with available profile data."
      }
    }
  }
  
  @IBOutlet private var ageLabel:UILabel!
  @IBOutlet private var bloodTypeLabel:UILabel!
  @IBOutlet private var biologicalSexLabel:UILabel!
  @IBOutlet private var weightLabel:UILabel!
  @IBOutlet private var heightLabel:UILabel!
  @IBOutlet private var bodyMassIndexLabel:UILabel!
  
  private let userHealthProfile = UserHealthProfile()
  
  private func updateHealthInfo() {
    loadAndDisplayAgeSexAndBloodType()
    loadAndDisplayMostRecentWeight()
    loadAndDisplayMostRecentHeight()
  }
    
    private func authorizeHealthKit() {
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
            
            guard authorized else {
                if let error = error {
                    print("HealthKit Authorization Failed. Reason: \(error.localizedDescription)")
                } else {
                    print("HealthKit Authorization Failed")
                }
                return
            }
            
            DispatchQueue.main.async {
                UIApplication.shared.open(URL(string: "x-apple-health://")!)
            }
            
            print("HealthKit Successfully Authorized.")
        }
    }
  
  private func loadAndDisplayAgeSexAndBloodType() {
    do {
        let userAgeSexAndBloodType = try ProfileDataStore.getAgeSexAndBloodType()
        userHealthProfile.age = userAgeSexAndBloodType.age
        userHealthProfile.biologicalSex = userAgeSexAndBloodType.biologicalSex
        userHealthProfile.bloodType = userAgeSexAndBloodType.bloodType
        updateLabels()
    } catch let error {
        self.displayAlert(for: error)
    }
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateHealthInfo()
    }
  
  private func updateLabels() {
    if let age = userHealthProfile.age {
        ageLabel.text = "\(age)"
    }
    
    if let biologicalSex = userHealthProfile.biologicalSex {
        biologicalSexLabel.text = biologicalSex.stringRepresentation
    }
    
    if let bloodType = userHealthProfile.bloodType {
        bloodTypeLabel.text = bloodType.stringRepresentation
    }
    
    if let weight = userHealthProfile.weightInKilograms {
        let weightFormatter = MassFormatter()
        weightFormatter.isForPersonMassUse = true
        weightLabel.text = weightFormatter.string(fromKilograms: weight)
    }
    
    if let height = userHealthProfile.heightInMeters {
        let heightFormatter = LengthFormatter()
        heightFormatter.isForPersonHeightUse = true
        heightLabel.text = heightFormatter.string(fromMeters: height)
    }
    
    if let bodyMassIndex = userHealthProfile.bodyMassIndex {
        bodyMassIndexLabel.text = String(format: "%.02f", bodyMassIndex)
    }
  }
  
  private func loadAndDisplayMostRecentHeight() {
    guard let heightSampleType = HKSampleType.quantityType(forIdentifier: .height) else {
        print("Height Sample Type is no longer available in HealthKit")
        return
    }
    
    ProfileDataStore.getMostRecentSample(for: heightSampleType) { (sample, error) in
        
        guard let sample = sample else {
            
            if let error = error {
                self.displayAlert(for: error)
            }
            
            return
        }
        
        let heightInMeters = sample.quantity.doubleValue(for: HKUnit.meter())
        self.userHealthProfile.heightInMeters = heightInMeters
        self.updateLabels()
    }
  }
  
  private func loadAndDisplayMostRecentWeight() {
    guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
        print("Body Mass Sample Type is no longer available in HealthKit")
        return
    }
    
    ProfileDataStore.getMostRecentSample(for: weightSampleType) { (sample, error) in
        
        guard let sample = sample else {
            
            if let error = error {
                self.displayAlert(for: error)
            }
            return
        }
        
        let weightInKilograms = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
        self.userHealthProfile.weightInKilograms = weightInKilograms
        self.updateLabels()
    }
  }
  
    //USE THIS ---
  private func saveBodyMassIndexToHealthKit() {
    guard let bodyMassIndex = userHealthProfile.bodyMassIndex else {
        displayAlert(for: ProfileDataError.missingBodyMassIndex)
        return
    }
    
    ProfileDataStore.saveBodyMassIndexSample(bodyMassIndex: bodyMassIndex,
                                             date: Date())
  }
  
  private func displayAlert(for error: Error) {
    
    let alert = UIAlertController(title: nil,
                                  message: error.localizedDescription,
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "O.K.",
                                  style: .default,
                                  handler: nil))
    
    present(alert, animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    guard let section = ProfileSection(rawValue: indexPath.section) else {
      fatalError("A ProfileSection should map to the index path's section")
    }
    
    switch section {
    case .saveBMI:
      saveBodyMassIndexToHealthKit()
    case .authorizeHealthKit:
      authorizeHealthKit()
    default: break
    }
  }
}
