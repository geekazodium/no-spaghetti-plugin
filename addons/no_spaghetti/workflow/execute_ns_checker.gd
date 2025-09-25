extends Node2D

var output: FileAccess;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ns_checker: SpaghettiChecker = SpaghettiChecker.new();
	ns_checker.load_rules();
	self.output = FileAccess.open("res://warnings_compact.txt",FileAccess.WRITE);
	ns_checker.lint_warnings_generated.connect(self.write_warning_to_file);
	ns_checker.check_program();
	self.output.close();
	
func write_warning_to_file(path: String, text: String, results: Array[RegExMatch]) -> void:
	var converted_res: Array[Array] = [];
	for r: RegExMatch in results:
		converted_res.append([r.get_start(), r.get_end()]);
	self.output.store_line(JSON.stringify([path, converted_res]));
