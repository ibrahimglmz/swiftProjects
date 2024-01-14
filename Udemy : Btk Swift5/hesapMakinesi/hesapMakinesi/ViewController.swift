import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ikinciSayi: UITextField!
    @IBOutlet weak var ilkSayi: UITextField!
    @IBOutlet weak var toplamSayi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func artiTiklandi(_ sender: Any) {
        if let ilksayi = Int(ilkSayi.text ?? ""), let ikincisayi = Int(ikinciSayi.text ?? "") {
            let toplam = ilksayi + ikincisayi
            toplamSayi.text = String(toplam)
        } else {
            toplamSayi.text = "Hatalı giriş"
        }
    }
    
    @IBAction func eksiTiklandi(_ sender: Any) {
        if let ilksayi = Int(ilkSayi.text ?? ""), let ikincisayi = Int(ikinciSayi.text ?? "") {
            let fark = ilksayi - ikincisayi
            toplamSayi.text = String(fark)
        } else {
            toplamSayi.text = "Hatalı giriş"
        }
    }
    
    @IBAction func carpmaTiklandi(_ sender: Any) {
        if let ilksayi = Int(ilkSayi.text ?? ""), let ikincisayi = Int(ikinciSayi.text ?? "") {
            let carpim = ilksayi * ikincisayi
            toplamSayi.text = String(carpim)
        } else {
            toplamSayi.text = "Hatalı giriş"
        }
    }
    
    @IBAction func bölmeTiklandi(_ sender: Any) {
        if let ilksayi = Int(ilkSayi.text ?? ""), let ikincisayi = Int(ikinciSayi.text ?? ""), ikincisayi != 0 {
            let bolum = ilksayi / ikincisayi
            toplamSayi.text = String(bolum)
        } else {
            toplamSayi.text = "Hatalı giriş veya sıfıra bölme hatası"
        }
    }
}

