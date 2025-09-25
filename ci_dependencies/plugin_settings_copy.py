import os

SECTION_COPY_HEADER = "[no_spaghetti]"
TESTING_PROJ_LINK = "https://raw.githubusercontent.com/geekazodium/no-spaghetti-plugin/refs/heads/main/ci_dependencies/project.godot"

settings: str = ""
with open ("project.godot", "r") as file:
    is_under_header: bool = False
    for line in file:
        if is_under_header:
            if line.strip().startswith("["):
                break
            settings = settings + line
        if line.strip() == SECTION_COPY_HEADER:
            is_under_header = True
            settings = settings + line

    file.close()
    
    print("user settings:")
    print(settings)

    print("removing and replacing project.godot")
    os.remove("project.godot")
    os.system("wget -O \"project.godot\" "+ TESTING_PROJ_LINK)

    print("appending user settings")
    with open ("project.godot", "a") as file:
        file.writelines("\n\n" + settings + "\n\n")