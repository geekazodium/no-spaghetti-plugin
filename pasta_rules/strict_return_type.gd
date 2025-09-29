@tool
extends Pasta

# MIT License (c) 2025 geekazodium

var compiled: RegEx = RegEx.create_from_string("func[ \t]+[a-zA-Z0-9_]+\\(.*\\)[\t ]*:");

func compile_rules() -> void: 
	pass;

func search_all(text: String, array: Array[RegExMatch]) -> void:
	for m: RegExMatch in self.compiled.search_all(text):
		array.append(m);
