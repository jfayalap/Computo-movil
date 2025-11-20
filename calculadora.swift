import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var displayVar: UITextField!
    
    var currentNumber: String = ""
    var previousNumber: Double = 0
    var operation: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        displayVar.text = ""
    }

    func appendNumber(_ num: String) {
        currentNumber += num
        displayVar.text = currentNumber
    }

    // NUMEROS
    @IBAction func button0Action(_ sender: UIButton) { appendNumber("0") }
    @IBAction func button1Action(_ sender: UIButton) { appendNumber("1") }
    @IBAction func button2Action(_ sender: UIButton) { appendNumber("2") }
    @IBAction func button3Action(_ sender: UIButton) { appendNumber("3") }
    @IBAction func button4Action(_ sender: UIButton) { appendNumber("4") }
    @IBAction func button5Action(_ sender: UIButton) { appendNumber("5") }
    @IBAction func button6Action(_ sender: UIButton) { appendNumber("6") }
    @IBAction func button7Action(_ sender: UIButton) { appendNumber("7") }
    @IBAction func button8Action(_ sender: UIButton) { appendNumber("8") }
    @IBAction func button9Action(_ sender: UIButton) { appendNumber("9") }

    // OPERACIONES
    @IBAction func buttonSumAction(_ sender: UIButton) {
        setOperation("+")
    }
    @IBAction func buttonMinAction(_ sender: UIButton) {
        setOperation("-")
    }
    @IBAction func buttonMulAction(_ sender: UIButton) {
        setOperation("*")
    }
    @IBAction func buttonDivaction(_ sender: UIButton) {
        setOperation("/")
    }

    func setOperation(_ op: String) {
        previousNumber = Double(currentNumber) ?? 0
        currentNumber = ""
        operation = op
    }

    // RESULTADO
    @IBAction func buttonResultAction(_ sender: UIButton) {
        let newNumber = Double(currentNumber) ?? 0
        var result: Double = 0

        switch operation {
        case "+": result = previousNumber + newNumber
        case "-": result = previousNumber - newNumber
        case "*": result = previousNumber * newNumber
        case "/": result = newNumber != 0 ? previousNumber / newNumber : 0
        default: break
        }

        displayVar.text = "\(result)"
        currentNumber = "\(result)"
    }

    // AC
    @IBAction func buttonAcAction(_ sender: UIButton) {
        currentNumber = ""
        previousNumber = 0
        operation = ""
        displayVar.text = ""
    }
}
