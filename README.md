# No Spaghetti Plugin

**No Spaghetti Plugin** is a Godot addon and GitHub CI workflow for checking
for spaghetti code, such as attempting to reference nodes way too far out in
the tree in scripts.

## Version Support

plugin: 4.3+ 
ci-workflow: 4.3 only.

## Getting Started

Download the latest release, extract it to the folder of your project,
enable the plugin, reload, and run a check to see where there's potential
spaghetti coding practices.

## Pasta-Rules

pasta rules follow the template below, to create
your own pasta rule, add it to the default pasta_rules
folder in your project (the path for the folder can be changed in configuration)
```GdScript
@tool
extends Pasta

#optional overrides
#func is_covered(file_name: String) -> bool:
#	return false;
#func only_filename() -> bool:
#	return false;

#required methods
## compiled_rules is called before checks are done, usually to update
## regular expressions
func compile_rules() -> void:
	pass

## search all of a file, and add matching results to the array that is
## passed in.
func search_all(text: String, array: Array[RegExMatch]) -> void:
	pass
```
currently, it's recommended that you only use regexes and simple logic
to check for code style errors, the compile method is always run before.
checks, assign regex fields in that method.

## License

Project licensed under MIT