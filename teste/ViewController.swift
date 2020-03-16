//
//  ViewController.swift
//  teste
//
//  Created by Alexandra Viana Zarzar on 02/03/20.
//  Copyright © 2020 Alexandra Viana Zarzar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var imagem1: UIImageView!
    @IBOutlet var imagem2: UIImageView!
    @IBOutlet var imagem3: UIImageView!
    @IBOutlet var imagem4: UIImageView!
    @IBOutlet var imagem5: UIImageView!
    @IBOutlet var imagem6: UIImageView!
    
    func configureButtons(){
        imagem1.layer.cornerRadius = 7
        imagem2.layer.cornerRadius = 7
        imagem3.layer.cornerRadius = 7
        imagem4.layer.cornerRadius = 7
        imagem5.layer.cornerRadius = 7
        imagem6.layer.cornerRadius = 7
    }
    
    //MARK:- BOTOES
    var etapas: Int = 0
    var tempoDeslocamento: Int = 0
    @IBAction func restaurante(_ sender: UIButton) {
        tempoDeslocamento = 8
    }
    @IBAction func barzinho(_ sender: UIButton) {
        tempoDeslocamento = 10
    }
    @IBAction func shopping(_ sender: UIButton) {
        tempoDeslocamento = 8
    }
    @IBAction func trabalho(_ sender: UIButton) {
        tempoDeslocamento = 15
    }
    @IBAction func faculdade(_ sender: UIButton) {
        tempoDeslocamento = 30
    }
    @IBAction func academia(_ sender: UIButton) {
        tempoDeslocamento = 10
    }
    //MARK: -TABLE VIEW
    @IBOutlet var pageControl: UIPageControl!
    var scrollView = UIScrollView()
    
    var tableView1 = UITableView()
    var tableView2 = UITableView()
    var tableView3 = UITableView()
    var tableView4 = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        scrollView.delegate = self
        
        tableView1.delegate = self
        tableView2.delegate = self
        tableView3.delegate = self
        tableView4.delegate = self
        
        tableView1.register(UINib(nibName: "SystemTableViewCell", bundle: nil), forCellReuseIdentifier: "SystemTableViewCell")
        tableView2.register(UINib(nibName: "SystemTableViewCell", bundle: nil), forCellReuseIdentifier: "SystemTableViewCell")
        tableView3.register(UINib(nibName: "SystemTableViewCell", bundle: nil), forCellReuseIdentifier: "SystemTableViewCell")
        tableView4.register(UINib(nibName: "SystemTableViewCell", bundle: nil), forCellReuseIdentifier: "SystemTableViewCell")
        
        tableView1.dataSource = self
        tableView2.dataSource = self
        tableView3.dataSource = self
        tableView4.dataSource = self
        
        timeField.inputView = datePicker
        timeField.textAlignment = .center
        timeField.placeholder = "selecione o horário"
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        setUpScrollView()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        self.view.bringSubviewToFront(pageControl)
        tableView1.reloadData()
        
    }
    func setUpScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.frame = CGRect(x: 0, y: 430, width: 414, height: 250)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(4), height: scrollView.frame.height)
        
        
        let width = scrollView.frame.width
        
        let rosto = UILabel(frame: CGRect(x: 175, y: -195, width: width - 100, height: width))
        rosto.text = "Rosto"
        rosto.font = UIFont(name: "Euphemia UCAS", size: 30)
        rosto.textColor = UIColor(red: CGFloat(133)/255, green: CGFloat(184)/255, blue: CGFloat(190)/255, alpha: 1)
        
        let cabelo = UILabel(frame: CGRect(x: 175 + width, y: -195, width: width - 100, height: width))
        cabelo.text = "Cabelo"
        cabelo.font = UIFont(name: "Euphemia UCAS", size: 30)
        cabelo.textColor = UIColor(red: CGFloat(133)/255, green: CGFloat(184)/255, blue: CGFloat(190)/255, alpha: 1)
        
        let maquiagem = UILabel(frame: CGRect(x: 150 + (2*width), y: -195, width: width - 100, height: width))
        maquiagem.text = "Maquiagem"
        maquiagem.font = UIFont(name: "Euphemia UCAS", size: 30)
        maquiagem.textColor = UIColor(red: CGFloat(133)/255, green: CGFloat(184)/255, blue: CGFloat(190)/255, alpha: 1)
        
        let corpo = UILabel(frame: CGRect(x: 175 + (3*width), y: -195, width: width - 100, height: width))
        corpo.text = "Corpo"
        corpo.font = UIFont(name: "Euphemia UCAS", size: 30)
        corpo.textColor = UIColor(red: CGFloat(133)/255, green: CGFloat(184)/255, blue: CGFloat(190)/255, alpha: 1)
        
        
        tableView1.frame = CGRect(x: 40, y: 40, width: width - 100, height: width)
        tableView1.backgroundColor = .clear
        tableView2.frame = CGRect(x: 40 + width, y: 40, width: width - 100, height: width)
        tableView2.backgroundColor = .clear
        tableView3.frame = CGRect(x: 40 + (2 * width), y: 40, width: width - 100, height: width)
        tableView3.backgroundColor = .clear

        tableView4.frame = CGRect(x: 40 + (3 * width), y: 40, width: width - 100, height: width)
        tableView4.backgroundColor = .clear


        scrollView.addSubview(tableView1)
        scrollView.addSubview(tableView2)
        scrollView.addSubview(tableView3)
        scrollView.addSubview(tableView4)
        scrollView.addSubview(rosto)
        scrollView.addSubview(cabelo)
        scrollView.addSubview(maquiagem)
        scrollView.addSubview(corpo)


            
        

        self.view.addSubview(scrollView)
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("oi")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SystemTableViewCell"
        print(cellIdentifier)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SystemTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        cell.cellSwitch.setOn(false, animated: true)
        if tableView == tableView1 {
            if indexPath.row == 0{
                cell.label.text = "máscara facial"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 10
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 10
                    print("oieee")
                }
            }else if indexPath.row == 1{
                cell.label.text = "sabonete antiacne"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 3
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 3
                }
            }else if indexPath.row == 2{
                cell.label.text = "fazer sobrancelha"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 15
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 15
                }
            }else{
                cell.label.text = "fazer a barba"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 5
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 5
                }
            }
        }else if tableView == tableView2 {
            if indexPath.row == 0{
                cell.label.text = "lavar"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 7
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 7
                }
            }else if indexPath.row == 1{
                cell.label.text = "hidratar"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 10
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 10
                }
            }else if indexPath.row == 2{
                cell.label.text = "secar"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 30
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 30
                }
            }else{
                cell.label.text = "fazer penteado"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 30
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 30
                }
            }
        }else if tableView == tableView3{
            if indexPath.row == 0{
                cell.label.text = "para o dia a dia"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 15
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 15
                }
            }else if indexPath.row == 1{
                cell.label.text = "para a noite"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 30
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 30
                }
            }else if indexPath.row == 2{
                cell.label.text = "apenas pele"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 10
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 10
                }
            }else{
                cell.label.text = "artística"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 60
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 60
                }
            }
        }else{
            if indexPath.row == 0{
                cell.label.text = "tomar banho"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 10
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 10
                }
            }else if indexPath.row == 1{
                cell.label.text = "depilação"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 20
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 20
                }
            }else if indexPath.row == 2{
                cell.label.text = "exfoliação"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 3
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 3
                }
            }else{
                cell.label.text = "decidir um look"
                cell.callback = { isOn in
                    if isOn == true {
                        self.etapas += 15
                    }
                }

                if cell.cellSwitch.isOn{
                    etapas += 15
                }
            }
        }
            
        return cell
        
        
    }
    
    // MARK:-Time Picker
    var dataGlobal: Date = Date()
    var datePicker: UIDatePicker {
      get {
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .time
        datePicker.addTarget(self,
          action: #selector(onDateChanged(sender:)),
          for: .valueChanged)
        datePicker.backgroundColor = UIColor.white
        return datePicker
        
      }
    }
    @objc func onDateChanged(sender: UIDatePicker) {
      let dateFormatter = DateFormatter()

      dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: sender.date)
        dataGlobal = sender.date
      
      timeField.text = strDate
    }
   
    @IBOutlet var timeField: UITextField!
    
    //MARK:-
    
    
    

    func calculoDoTempo() -> Int{
        //somar o tempo de casa atividade do checklist marcada com o tempo para ir ao destino final

        let resultado = tempoDeslocamento + etapas
        return resultado
    }
    
    @IBAction func calcular(_ sender: Any) {
        var tempo = calculoDoTempo()
        var intervalo: TimeInterval = TimeInterval(tempo*60)
        var data: Date = dataGlobal.addingTimeInterval(-intervalo)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDateNew = dateFormatter.string(from: data)
        var string = "comece a se arrumar de " + strDateNew + "  você vai demorar" + " " + String(tempo) + " minutos"
    
        let alert = UIAlertController(title: "Atenção", message: string, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Certo", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

