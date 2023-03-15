extends Node

var file = File.new()

func save_data(data, file_name):
	file.open("user://" + file_name, File.WRITE)
	file.store_var(data)
	file.close()

func load_data(file_name):
	file.open("user://" + file_name, File.READ)
	var data = file.get_var()
	file.close()
	return data
