extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ns_checker: SpaghettiChecker = SpaghettiChecker.new();
	ns_checker.load_rules();
	ns_checker.check_program();
