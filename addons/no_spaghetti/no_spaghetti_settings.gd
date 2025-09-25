@tool
extends Resource
class_name NoSpaghettiSettings

var settings: Array[Dictionary] = [
	{
		"default": "addons/no_spaghetti/checker/pastas/",
		"name": "no_spaghetti/rules_src",
		"type": TYPE_STRING_NAME,
		"hint": PROPERTY_HINT_DIR,
		"description": "This is the directory where no_spaghetti will read the ignored file list"
	},
	{
		"default": ["addons/"],
		"name": "no_spaghetti/ignores",
		"type": TYPE_ARRAY,
		"hint": PROPERTY_HINT_ARRAY_TYPE,
		"hint_string": ("%d:" % [TYPE_STRING]),
		"description": "Ignored directories"
	}
];

func register_properties() -> void:
	for p: Dictionary in self.settings:
		if !ProjectSettings.has_setting(p.get("name")):
			ProjectSettings.set(p.get("name"), p.get("default"));
		ProjectSettings.set_initial_value(p.get("name"), p.get("default"));
		ProjectSettings.add_property_info(p);
