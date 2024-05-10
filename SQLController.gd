extends Control
var database : SQLite

# Called when the node enters the scene tree for the first time.
func _ready():
	database = SQLite.new()
	database.path = "res://database/data.db"
	database.open_db()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_create_button_down():
	var table = {
		"id":{"data_type":"int","primary_key":true,"not_null":true,"auto_increment":true},
		"nama":{"data_type":"text"},
		"jumlah":{"data_type":"int"}
	}
	database.create_table("NPC",table)
	pass # Replace with function body.


func _on_insert_button_down():
	var data = {
		"nama" : $item.text,
		"jumlah" : int($jumlah.text)
	}
	database.insert_row("NPC",data)
	pass # Replace with function body.


func _on_update_button_down():
	database.update_rows("NPC","nama = '" + $item.text + "'",{"jumlah":int($jumlah.text)})
	pass # Replace with function body.


func _on_select_button_down():
	var data = database.select_rows("NPC","jumlah>0",["*"])
	var nama = database.select_rows("NPC","jumlah>0",["nama"])
	print(data)
	print(nama)
	for i in nama:
		print(i["nama"])
	pass # Replace with function body.


func _on_delete_button_down():
	database.delete_rows("NPC","nama = '"+$item.text+"'")
	pass # Replace with function body.


func _on_add_button_down():
	var add
	var data = database.select_rows("NPC","",["*"])
	for i in data:
		if i['nama'] == $item.text:
			add = int(i['jumlah']) + 1
	database.update_rows("NPC","nama = '"+$item.text+"'",{'jumlah':add})
	pass # Replace with function body.


func _on_load_button_down():
	database.close_db()
	database.path = "res://database/save.sv"
	database.open_db()
	pass # Replace with function body.


func _on_save_button_down():
	database.backup_to("res://database/save.sv")
	pass # Replace with function body.
