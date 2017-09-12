//
//  ViewController.swift
//  ToDoListCoreData
//
//  Created by Satyam Saluja on 29/06/17.
//  Copyright © 2017 Satyam Saluja. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var todoListArray:[Todolist]=[]
    var list:[String]=[]

    @IBAction func addItem(_ sender: UIButton) {
        if(toDoTextFeild.text != ""){
        let ToDoList1=Todolist(context: AppDelegate.shared().persistentContainer.viewContext)
        let item=String(toDoTextFeild.text!)
        ToDoList1.toDoListText=item
        list.append(item!)
        AppDelegate.shared().saveContext()
        mytable.reloadData()
        toDoTextFeild.text=""
        }}
    @IBOutlet weak var toDoTextFeild: UITextField!
    @IBOutlet weak var mytable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mytable.delegate=self
        mytable.dataSource=self
        do{
            let fetch:NSFetchRequest<Todolist>=Todolist.fetchRequest()
            todoListArray=try AppDelegate.shared().persistentContainer.viewContext.fetch(fetch)
        }
        catch{
            //handle errors
        }
        for todo in todoListArray{
            list.append(todo.toDoListText!)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        mytable.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sw=indexPath.row%3
        if sw==0{
            let cell1=tableView.dequeueReusableCell(withIdentifier: "mycell") as! MyTableViewCell
            cell1.mylable.text=list[indexPath.row]
            //cell.textLabel?.text=todoListArray[indexPath.row].toDoListText
            return cell1

        }else if sw==1{
        let cell2=tableView.dequeueReusableCell(withIdentifier: "mycell2") as! MyTableViewCell2
        cell2.mylable2.text=list[indexPath.row]
        return cell2
        } else{
            let cell3=tableView.dequeueReusableCell(withIdentifier: "mycell3") as! MyTableViewCell3
            cell3.lable3.text=list[indexPath.row]
            return cell3

        }
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle==UITableViewCellEditingStyle.delete{
            do{
                let fetch:NSFetchRequest<Todolist>=Todolist.fetchRequest()
                todoListArray=try AppDelegate.shared().persistentContainer.viewContext.fetch(fetch)
            }
            catch{
                //handle errors
            }

            list.remove(at:indexPath.row)
            AppDelegate.shared().persistentContainer.viewContext.delete(todoListArray[indexPath.row])
            AppDelegate.shared().saveContext()
            mytable.reloadData()
        }
    }
    

}
