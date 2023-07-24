extends Node2D

func _ready():
	var data_to_send = [
	["Since the birth of our Nation policies and directives have been made by:","the Joint Staff","military leaders","civilians assigned to the military and the executive and legislative branches","the Chairman of the Joint Chiefs of Staff with the advice and consent of the senate",3],
	["What establishes the basic principle of civilian control of the U.S. Armed Forces?","the U.S. Constitution","the Law of Armed Conflict","the British Articles of War","the Uniform Code of Military Justice",1],
	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces beginning with the President's role as:","Commander in Chief","Secretary of Defense","head of the legislative and judicial branches","liaison to the Secretary of Defense for Policy",1],
	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces. Who serves as Commander in Chief and has final command authority?","the President","the Secretary of State","the Secretary of Defense","the Chairman Joint Chiefs of Staff",1],
	["The President serves as Commander in Chief of the Armed Forces and has final command authority. However as head of the executive branch he is subject to the checks and balances system of:","the legislative and judicial branches","the Armed Forces Policy Council","the Uniform Code of Military Justice","the Department of Defense and Secretary of Defense",3],
	["By statute the chain of command runs from the President through the Secretary of Defense to:","the Combatant Commanders","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff","the Secretaries of the military departments",1],
	["When forces are assigned to the Combatant Commanders administrative control over those forces still typically flows through:","the Combatant Commanders","their respective service branch","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff",2],
	["Although the chain of command runs from the President through the Secretary of Defense to the Combatant Commanders a provision of this law permits the President to authorize communications through the Chairman Joint Chiefs of Staff placing the Chairman in the communications chain of command.","Key West Agreement","Air Force Letter 35.3","National Security Act of 1947","Goldwater-Nichols DoD Reorganization Act of 1986",4]
	]
	var json_string = JSON.stringify(data_to_send)
	var json = JSON.new()

	# Save data
	# ...
	# Retrieve data
	var error = json.parse(json_string)
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_ARRAY:
			print(data_received) # Prints array
		else:
			print("Unexpected data")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())

