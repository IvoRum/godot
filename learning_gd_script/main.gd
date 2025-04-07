extends Node

var heath:int=100# static types
var mana:=100	#Static infured typesing godot will know that this is a int
@export var damage:=15 # Export allows to be set in the editor 
const GRAVETY=-9.81
enum Alignment {ALLY,FRIEND,ENOMY}
var unit_alignment=Alignment.ALLY

func _ready() -> void:
	$Label.text="hello world"
	$Label.modulate=Color.AQUAMARINE
	print()
		# random number
	
	var roll=randf()#gives randome number between 1:100
	var character_height= randf_range(140,210)#random number in a range
	print("You character hight is: "+str(character_height))
	
	#Arrays
	var items=["Domati",1,3.21,false]
	var vilage_names:Array[String]=["Shumen","Varna"]
	print(items[0])#get by index
	
	items[1]="apples"#edit by index
	
	items.remove_at(1)#remove by index
	items.append("Sword")
	
	#Loops
	for item in items:
		print(item)
	
	for n in 8: #for int i=0 i<8 i++
		print("n: "+str(n))
	
	var glass:=0.0 
	
	while glass <0.5:
		glass+=randf_range(0.01,0.2)
		print("Glass: "+str(glass))
	print("The glass is full")
	
	#Dictunary
	
	var my_dickt ={"Crook":1, "Villain":35, "Boos":100}
	print(my_dickt["Crook"])#this liww get by key
	my_dickt["Crook"]=50#Reasign
	my_dickt["The Rock"]=999#add to dickt
	
	for username in my_dickt:
		print(username+" : "+str(my_dickt[username]))
		
	var players ={
		"Crook":{"Level":1, "Health":12}, 
		"Villain":{"Level":35, "Health":120}, 
		"Boos":{"Level":100, "Health":120000}
		}
	print(players["Boos"]["Health"])
	
	#match
	match unit_alignment:
		Alignment.ENOMY:
			print("Taset my blade")
		Alignment.FRIEND:
			print("Hello friend")
		_: #if none applay
			print("Koi si ti be")
	

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("my_action")):
		$Label.modulate=Color.RED 
	if(event.is_action_released("my_action")):
		$Label.modulate=Color.GREEN
		
		#VARIBLES
	if event.is_action_pressed("my_action"):
		heath-=20
		print("your healt "+ str(heath))#Casting
		if heath<=0:
			print("YOU DIE")
		elif heath<50:
			print("YOU are injurd")
		else:
			print("HEALTHY") 
	
