import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var diagLabel: UILabel!
    @IBOutlet weak var addrLabel: UILabel!
    @IBOutlet weak var statLabel: UILabel!
    @IBOutlet weak var nameDeleteLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var diagnosysTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var deleteNameField: UITextField!
    
    
    @IBOutlet weak var addPatientButton: UIButton!
    @IBOutlet weak var statButton: UIButton!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var defButton: UIButton!
    
    var patientBase = [Patient]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttons()
    }
    
    //MARK: - Actions
    @IBAction func addPatientButtonPressed(_ sender: UIButton) {
        let ageTime = Int(ageTextField.text!)!
        if ageTime != nil {
            patientBase.append(Patient(name: nameTextField.text!,
                                       age: ageTime,
                                       diagnosys: String(diagnosysTextField.text!),
                                       address: addressTextField.text!))
            
        }
        self.addClear()
    }
    @IBAction func statButtonPressed(_ sender: UIButton) {
        statLabel.text! = self.stat(patients: patientBase)
        
    }
    @IBAction func delButtonPressed(_ sender: UIButton) {
        let removePatient = deleteNameField.text!
        patientBase = self.delPatient(removePatient: removePatient)
    }
    @IBAction func defButtonPressed(_ sender: UIButton) {
        patientBase = self.defaultBase()
    }
    
    
    //MARK: - Other func
    
    func stat(patients: [Patient]) -> String {
        var statText = ""
        for element in patientBase {
            statText += "\(element.name), \(element.age), \(element.diagnosys) \n"
        }
        return statText
    }
    
    func delPatient(removePatient: String) -> [Patient]{
        for (index, element) in patientBase.enumerated(){
            if element.name == removePatient {
                patientBase.remove(at: index)
            }
        }
        deleteNameField.text = nil
        deleteNameField.resignFirstResponder()
        return patientBase
    }
    
    func defaultBase() -> [Patient]{
        patientBase.removeAll()
        patientBase.append(Patient(name: "Mark", age: 37, diagnosys: "Embolism", address: "Germany, Berlin"))
        patientBase.append(Patient(name: "Alice", age: 25, diagnosys: "Ischemia", address: "Germany, Munchen"))
        patientBase.append(Patient(name: "Tony", age: 57, diagnosys: "Myocardial infarction", address: "Germany, City"))
        self.addClear()
        deleteNameField.text = nil
        deleteNameField.resignFirstResponder()
        return patientBase
    }
    func addClear(){
        nameTextField.text = nil
        ageTextField.text = nil
        diagnosysTextField.text = nil
        addressTextField.text = nil
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        diagnosysTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
    }
    func buttons(){
        addPatientButton.titleLabel?.numberOfLines=0
        statLabel.numberOfLines=0
        statLabel.layer.borderWidth = 1
        statLabel.layer.cornerRadius = 5
        defButton.layer.borderWidth = 1
        defButton.layer.cornerRadius = 1
        addPatientButton.layer.borderWidth = 1
        addPatientButton.layer.cornerRadius = 3
        delButton.layer.borderWidth = 1
        delButton.layer.cornerRadius = 3
        
    }
}





