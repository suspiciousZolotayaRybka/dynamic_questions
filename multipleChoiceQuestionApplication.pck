GDPC                 `                                                                      %   `   res://.godot/exported/133200997/export-0fa6ce60882eff8c9ed70ecfbe6d1c3f-page_of_one_question.scnpw      �      ���GԊ���r�|��    `   res://.godot/exported/133200997/export-17003bc07ef07d3a2b97f0d635135c91-view_all_questions.scn  �)     ?       �>�����p�u�W    X   res://.godot/exported/133200997/export-7511a1c6d17660ce99f7a35eed0c96fd-single_entry.scn��      Q      ��Fw��=��.'a�n�    h   res://.godot/exported/133200997/export-8c54ee64c9f5cc1c1bba531cc7989390-ask_for_number_of_questions.scn �      U      >��d4:*<��^jzѡ    d   res://.godot/exported/133200997/export-954bd05a74def8d58b9b4cdaaa40921b-page_of_two_questions.scn   0}      l      ��� �Y<��?    d   res://.godot/exported/133200997/export-96ce2d657223e135dea58a26ffd349ea-testing_code_deleteme.scn   0�            .�:wGp�73q,jw    d   res://.godot/exported/133200997/export-aeecf76b1149ea9c17dfa8228fedcb18-single_page_of_questions.scnP     M	      ����i2W;ࣽ�    \   res://.godot/exported/133200997/export-c02dfd1018b0ee82b97108aea0a8a5a8-page_navigation.scn �b      }      ��(�-�~&�{bN}`     d   res://.godot/exported/133200997/export-db35dc3d9bcf75b168b70cf62b7ec40e-main_dynamic_questions.scn  �=      �      �8p�.��aI�Mn��    `   res://.godot/exported/133200997/export-ec2bbcdf9d54d6a57a344639e373b587-test_scene_deleteme.scn �&     �      ��r� #����V:    ,   res://.godot/global_script_class_cache.cfg                 ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexP!      ^      2��r3��MgB�[79       res://.godot/uid_cache.bin  �E     �      ������d�p��#<�       res://all_questions.gd          �      U��1I��<�ʃ���    ,   res://ask_for_number_of_questions.tscn.remap�0     x       �̱W�<� ���       res://button_group.gd          ,      �����еB��q[�V�       res://icon.svg  �5     N      ]��s�9^w/�����       res://icon.svg.import   �.      �       �S��Cg��e95j�)       res://line_edit_group.gd�/      W      �O!�Yy��1C5�]�a        res://main_dynamic_questions.gd �:      �      ���q�<��F{��V�z    (   res://main_dynamic_questions.tscn.remap @1     s       �s�W��^Z�N]��d�       res://page_navigation.gdPA      �!      �.g�L�.�[@=�9�D        res://page_navigation.tscn.remap�1     l       o�O��G��%"��f�    (   res://page_of_one_question.tscn.remap   02     q       |�*C�|!�^Kq��R�    (   res://page_of_two_questions.tscn.remap  �2     r       jx�h�Xn��A�) O�       res://proceed_button.gd ��      �      �nP��������p       res://project.binary�G     W      ��y_/n?��$ߚy�       res://question_profile.gd   ��      �H      d�#3:�}�H�2]�f�        res://single_entry.tscn.remap   �3     i       l���dҀ�hz/��       res://single_entry_1.gd �      Q      #M\�7|�p=�!�֚s       res://single_entry_2.gd p�      �      g�����ft���6�(       res://single_entry_3.gd       O      �p"�$]�v�����h�    ,   res://single_page_of_questions.tscn.remap    4     u       j5s�ŵ�8�[0��       res://test_scene_DELETEME.gd�      O      7�rA��9u�����l�    $   res://test_scene_deleteme.tscn.remap�4     p       ��K)Ú\��(�    (   res://testing_code_deleteme.tscn.remap  03     r       �2EJz�?�Ujd9Z    $   res://view_all_questions.tscn.remap 5     o       h����x��h$(���    �{��w���list=Array[Dictionary]([])
M2恃extends Control

func _ready():
	# Declare and assign variables
	const QUESTION_POSITION_X = 25
	var question_position_y: int = 25
	var current_question = 0
	var has_entered_questions = false
	
	# Iterate through each question and print it to the screen, along with edit buttons
	for question_and_answer in QuestionProfile._get_questions_and_answers():
		# If the current question is blank, skip
		if (question_and_answer[0] == "" and question_and_answer[1] == "" and question_and_answer[2] == "" and question_and_answer[3] == "" and question_and_answer[4] == "" and question_and_answer[5] == -1):
				pass
		else:
			has_entered_questions = true
			# Otherwise fill in the question
			# Set the current question as text on the screen at the current position
			var question_label = Label.new()
			question_label.text = "%d. %s\n" % [current_question + 1, question_and_answer[QuestionProfile.QUESTION]]
			question_label.text += "        a. %s\n" % [question_and_answer[QuestionProfile.ANSWER_A]]
			question_label.text += "        b. %s\n" % [question_and_answer[QuestionProfile.ANSWER_B]]
			question_label.text += "        c. %s\n" % [question_and_answer[QuestionProfile.ANSWER_C]]
			question_label.text += "        d. %s\n" % [question_and_answer[QuestionProfile.ANSWER_D]]
			# Godot's switch statement
			var result
			match question_and_answer[QuestionProfile.ANSWER]:
				1:
					result = "a"
				2:
					result = "b"
				3:
					result = "c"
				4:
					result = "d"
			question_label.text += "Correct Answer: %s" % [result]
			question_label.size = Vector2(QUESTION_POSITION_X, 0)
			question_label.position = Vector2(QUESTION_POSITION_X, question_position_y)
			self.add_child(question_label)
			question_position_y += 200
			self.custom_minimum_size = Vector2(QUESTION_POSITION_X, question_position_y)
		current_question += 1
	
	# Assign the go_to_question option button options
	for i in current_question:
		$go_to_question.add_item("Return to Question " + str(i + 1))
	
	# if the user has entered no questions, inform them of this
	if (not(has_entered_questions)):
		$go_to_question.text = "No Questions"
		$go_to_question.disabled = true
		$not_has_entered_questions.visible = true

func _on_return_pressed():
	# If the user is on the last page, check to see what page scene needs to be returned to
	if (QuestionProfile._get_current_page() == QuestionProfile._get_num_pages()):
		if ((QuestionProfile._get_num_questions() % 3) == 2):
			# If user is on the last page with two questions, return to this scene
			get_tree().change_scene_to_file("res://page_of_two_questions.tscn")
		elif ((QuestionProfile._get_num_questions() % 3) == 1):
			# If user is on the last page with one question, return to this scene
			get_tree().change_scene_to_file("res://page_of_one_question.tscn")
		else:
			# Otherwise return to the single_page_of_questions
			get_tree().change_scene_to_file("res://single_page_of_questions.tscn")
	else:
		# Otherwise return to the single_page_of_questions
		get_tree().change_scene_to_file("res://single_page_of_questions.tscn")

func _on_go_to_question_item_selected(index):
	# Set the current_question and current_page 
	QuestionProfile._set_current_question(index)
	if (((QuestionProfile._get_current_question() + 1) % 3) == 0):
		# If question is divisible by three, the current page is exactly the question / 3
		QuestionProfile._set_current_page((QuestionProfile._get_current_question() + 1)/ 3)
	else:
		# Otherwise use integer division to knock off the fraction and add one for current page
		QuestionProfile._set_current_page(((QuestionProfile._get_current_question() + 1) / 3) + 1)
	# If the user is on the last page, check to see what page scene needs to be returned to
	if (QuestionProfile._get_current_page() == QuestionProfile._get_num_pages()):
		if ((QuestionProfile._get_num_questions() % 3) == 2):
			# If user is on the last page with two questions, return to this scene
			get_tree().change_scene_to_file("res://page_of_two_questions.tscn")
		elif ((QuestionProfile._get_num_questions() % 3) == 1):
			# If user is on the last page with one question, return to this scene
			get_tree().change_scene_to_file("res://page_of_one_question.tscn")
		else:
			# Otherwise return to the single_page_of_questions
			get_tree().change_scene_to_file("res://single_page_of_questions.tscn")
	else:
		# Otherwise return to the single_page_of_questions
		get_tree().change_scene_to_file("res://single_page_of_questions.tscn")

func _on_scroll_container_gui_input(event):
	$return.position = Vector2(900, get_tree().get_root().find_child("scroll_container", true, false).scroll_vertical + 20)
	$go_to_question.position = Vector2(900, get_tree().get_root().find_child("scroll_container", true, false).scroll_vertical + 70)
��[��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://proceed_button.gd ��������      local://LabelSettings_lxaxv �         local://LabelSettings_5lels .         local://PackedScene_a8him d         LabelSettings          2         ��?��?��?  �?         LabelSettings          ��?��?��?  �?         PackedScene          	         names "         ask_for_number_of_questions    Node2D    question_label    offset_left    offset_top    offset_right    offset_bottom    text    label_settings    Label    requirements_label    proceed_line_edit    placeholder_text 	   LineEdit    proceed_button    script    Button    confirm_questions    title 	   position    visible    ConfirmationDialog #   _on_proceed_line_edit_text_changed    text_changed    _on_pressed    pressed     _on_confirm_questions_confirmed 
   confirmed    	   variants            �A     �A     JD     �B   ,   How many training questions will you enter?                �A     �B    ��C     C      Recommended: 200
Max: 300               �A     C     �C     TC      # of questions      YC     �B     �C                 -   �                node_count             nodes     \   ��������       ����                	      ����                                                    	   
   ����                        	      
                           ����                                                   ����                                                  ����                               conn_count             conns                                                                                   node_paths              editable_instances              version             RSRCR=����(o{=# Author: Isaac Finehout
# Date: 8 July 2023
# Purpose: Control filling in the arrays when the buttons for correct answers are chosen

extends Control

var answer_button_group
var temp_array

func _ready():
	# Create a button group with all of the buttons added
	# This creates a radio button like implementation
	answer_button_group = ButtonGroup.new()
	$answer_button_a.set_button_group(answer_button_group)
	$answer_button_b.set_button_group(answer_button_group)
	$answer_button_c.set_button_group(answer_button_group)
	$answer_button_d.set_button_group(answer_button_group)

# Signals from each button to receive the correct answer
func _on_answer_button_a_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 1
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_button_b_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 2
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_button_c_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 3
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_button_d_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 4
	QuestionProfile._set_questions_and_answers(temp_array)
�v?GST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  ��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bb8myqdtnylkm"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 ��uF����1��/�# Author: Isaac Finehout
# Date: 8 July 2023
# Purpose: Control filling in the arrays when user enters information into blanks (aka line edits)

extends Control

var temp_array = []

# Connect each single_entry to the release_all_focus function as they come online
func _process(_delta):
	var callable_on_release_all_focus = Callable(self, "_on_release_all_focus")
	var single_entry_1 = get_tree().get_root().find_child("single_entry_1", true, false)
	if (single_entry_1 != null):
		single_entry_1.connect("release_all_focus", callable_on_release_all_focus)
		var single_entry_2 = get_tree().get_root().find_child("single_entry_2", true, false)
		if (single_entry_2 != null):
			single_entry_2.connect("release_all_focus", callable_on_release_all_focus)
			var single_entry_3 = get_tree().get_root().find_child("single_entry_3", true, false)
			if (single_entry_3 != null):
				single_entry_3.connect("release_all_focus", callable_on_release_all_focus)
				# Remove the process callback to avoid unnecessary checks
				set_process(false)

# These functions receive signals whenever the user enters information in the line edits
func _on_question_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.QUESTION] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_a_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_A] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_b_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_B] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_c_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_C] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_d_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_D] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)

func _on_release_all_focus():
	$question.release_focus()
	$answer_a.release_focus()
	$answer_b.release_focus()
	$answer_c.release_focus()
	$answer_d.release_focus()


# Grab the focus of the keyboard depending on what text edit the user enters
func _on_question_mouse_entered():
	$question.grab_focus()
func _on_answer_a_mouse_entered():
	$answer_a.grab_focus()
func _on_answer_b_mouse_entered():
	$answer_b.grab_focus()
func _on_answer_c_mouse_entered():
	$answer_c.grab_focus()
func _on_answer_d_mouse_entered():
	$answer_d.grab_focus()
�91|�# Author: Isaac Finehout
# Date: 6 July 2023
# Purpose: The main scene of the program
# Contact: isaac.finehout@us.af.mil
#TODO I need to congregate all TODO's right here

extends Node2D

func _ready():
	# Initial popup informing user to enter questions in order of difficulty
	var instruction_dialog_string = "Please enter your questions in increasing level of difficulty.\n"
	instruction_dialog_string += "           Question 1 = easiest\n"
	instruction_dialog_string += "           ...\n"
	instruction_dialog_string += "           Question %d = hardest" % QuestionProfile._get_num_questions()
	$instruction_dialog.dialog_text = instruction_dialog_string
4�e{3�y9���@�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script     res://main_dynamic_questions.gd ��������   PackedScene $   res://single_page_of_questions.tscn �4���o]      local://PackedScene_eksdd W         PackedScene          	         names "   	      main_dynamic_questions    script    Node2D    instruction_dialog 	   position    visible    AcceptDialog    single_page_of_questions    warning_dialog    	   variants                 -   J                         node_count             nodes     $   ��������       ����                            ����                           ���                            ����                   conn_count              conns               node_paths              editable_instances              version             RSRC��^��;~# Author: Isaac Finehout
# Date: 7 July 2023
# Purpose: Control the page navigation bar and the information it displays

extends Node2D

# Initialize all variables for page navigation
func _ready():
	# Set page_label and question_label
	$page_label.text = "Page %d/%d" % [QuestionProfile._get_current_page(), QuestionProfile._get_num_pages()]
	$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]
	# Disable the back button
	if (QuestionProfile._get_current_page() == 1):
		$back_button.disabled = true
	# Set the option button options
	for i in QuestionProfile._get_num_pages():
		$page_option_button.add_item("Page " + str(i + 1))
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
	# Connect the signal to change the page
	var callable_on_current_page_changed = Callable(self, "_on_current_page_changed")
	QuestionProfile.connect("current_page_changed", callable_on_current_page_changed)
	# Connect the signal to change the current question
	var callable_on_current_question_changed = Callable(self, "_on_current_question_changed")
	QuestionProfile.connect("current_question_changed", callable_on_current_question_changed)
	# Set the correct file dialog options
	$file_dialog_save_questions.current_dir = "/"
	$file_dialog_load_questions.current_dir = "/"

func _on_current_question_changed():
	# Update question_label with current question
	$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]

# Update all variables for page navigation when the user changed the page
func _on_current_page_changed():
	# Update the page_label
	$page_label.text = "Page %d/%d" % [QuestionProfile._get_current_page(), QuestionProfile._get_num_pages()]
	# Disabled the back button if it is the first page
	if (QuestionProfile._get_current_page() == 1):
		$back_button.disabled = true
	else:
		$back_button.disabled = false
	# Disabled the next button if it is the last page
	if (QuestionProfile._get_current_page() == QuestionProfile._get_num_pages()):
		$next_button.disabled = true
	else:
		$next_button.disabled = false

# Turn the highlight around the menu options on
func _on_reference_rect_boundary_entry_mouse_entered():
	$menu_options_reference_rect.editor_only = false
# Turn the highlight around the menu options off
func _on_reference_rect_boundary_4_mouse_entered():
	$menu_options_reference_rect.editor_only = true
func _on_reference_rect_boundary_3_mouse_entered():
	$menu_options_reference_rect.editor_only = true
func _on_reference_rect_boundary_2_mouse_entered():
	$menu_options_reference_rect.editor_only = true
func _on_reference_rect_boundary_1_mouse_entered():
	$menu_options_reference_rect.editor_only = true

# Use signals from the next button to increment the current page
func _on_next_button_pressed():
	QuestionProfile._set_current_page(QuestionProfile._get_current_page() + 1)
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
	set_first_question_on_page()

# Use signals from the back button to decrement the current page
func _on_back_button_pressed():
	QuestionProfile._set_current_page(QuestionProfile._get_current_page() - 1)
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
	set_first_question_on_page()

# Use signals from the page option button to change the current page
func _on_page_option_button_item_selected(index):
	QuestionProfile._set_current_page(index + 1)
	set_first_question_on_page()

# Sets the current question to whatever the first one on the page is, used when visiting a new page
func set_first_question_on_page():
	# Always set current question to the first one on the page
	QuestionProfile._set_current_question(QuestionProfile._get_current_page()*3 - 3)
	get_tree().get_root().find_child("first_section_outline", true, false).editor_only = false
	if (not(QuestionProfile._get_is_single_entry_2_disabled())):
		# Don't make references to either single entry 2 or 3 if they are disabled
		get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true
		if (not(QuestionProfile._get_is_single_entry_3_disabled())):
			get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true

func _on_add_question_pressed():
	# Don't let the user enter over 300 questions
	if (QuestionProfile._get_num_questions() < 300):
		var temp_array = QuestionProfile._get_questions_and_answers()
		temp_array.insert(QuestionProfile._get_current_question(), ["","","","","",-1])
		QuestionProfile._set_num_questions(QuestionProfile._get_num_questions() + 1)
		update_num_pages()
		update_page_options()
		# Update the question label
		$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]
		# Set the current_page to update the new information
		QuestionProfile._set_current_page(QuestionProfile._get_current_page())
	else:
		$add_over_three_hundred_dialog.visible = true

func _on_delete_question_pressed():
	# Don't let the user get below three questions
	if (QuestionProfile._get_num_questions() > 3):
		# If the user still has over three questions, delete their current question
		var temp_array = QuestionProfile._get_questions_and_answers()
		temp_array.pop_at(QuestionProfile._get_current_question())
		QuestionProfile._set_questions_and_answers(temp_array)
		QuestionProfile._set_num_questions(QuestionProfile._get_num_questions() - 1)
		update_num_pages()
		# Check to see if user was on the last question and deleted it, move them back a page if so
		if (QuestionProfile._get_current_page() > QuestionProfile._get_num_pages()):
			QuestionProfile._set_current_page(QuestionProfile._get_num_pages())
		else:
			# Otherwise update the contents on the current page
			QuestionProfile._set_current_page(QuestionProfile._get_current_page())
		update_page_options()
		# Update the question label
		$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]
	# The user attempted to get under three questions
	else:
		$delete_under_three_dialog.visible = true

func _on_change_question_order_pressed():
	# TODO
	print("Changed Question Order")

func _on_view_all_questions_pressed():
	get_tree().change_scene_to_file("res://view_all_questions.tscn")

func _on_save_question_file_pressed():
	# Pop open the save dialog and warn the user not to overwrite root folders
	$file_dialog_save_questions.visible = true
	$overwrite_warning.visible = true

func _on_file_dialog_save_questions_file_selected(path):
	var save_string = QuestionProfile.questions_and_answers_to_string(QuestionProfile._get_questions_and_answers())
	var is_questions_and_answers_valid = QuestionProfile.get_is_questions_and_answers_valid(save_string)
	# Only save if the file is valid.
	if (is_questions_and_answers_valid):
		var save_file = FileAccess.open(path, FileAccess.WRITE)
		save_file.store_line(save_string.trim_suffix(" "))
		save_file.close()

func _on_load_question_file_pressed():
	# Pop open the load dialog and warn the user not to overwrite root folders
	$file_dialog_load_questions.visible = true
	$overwrite_warning.visible = true

func _on_file_dialog_load_question_file_selected(path):
	var load_string
	var load_file = FileAccess.open(path, FileAccess.READ)
	if load_file != null:  # Ensure the file was successfully opened
		load_string = load_file.get_as_text()
		load_file.close()
	var is_questions_and_answers_valid = QuestionProfile.get_is_questions_and_answers_valid(load_string)
	if (is_questions_and_answers_valid):
		var temp_array = QuestionProfile.questions_and_answers_to_array(load_string)
		QuestionProfile._set_questions_and_answers(temp_array)
		QuestionProfile._set_num_questions(len(QuestionProfile._get_questions_and_answers()))
		if (QuestionProfile._get_num_questions() % 3 == 0):
			QuestionProfile._set_num_pages(QuestionProfile._get_num_questions() / 3) 
		else:
			QuestionProfile._set_num_pages((QuestionProfile._get_num_questions() / 3) + 1)
		QuestionProfile._set_current_page(1)

func update_num_pages():
	if (QuestionProfile._get_num_questions() % 3 == 0):
		QuestionProfile._set_num_pages(QuestionProfile._get_num_questions() / 3) 
	else:
		QuestionProfile._set_num_pages((QuestionProfile._get_num_questions() / 3) + 1)

func update_page_options():
	$page_option_button.clear()
	for i in QuestionProfile._get_num_pages():
		$page_option_button.add_item("Page " + str(i + 1))
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
�����!�}��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://page_navigation.gd ��������      local://LabelSettings_gy5ph �         local://LabelSettings_nwgaq /         local://PackedScene_5b71u q         LabelSettings                   ��?��?��?  �?         LabelSettings                   ��?��?��?  �?         PackedScene          	         names "   C      page_navigation    script    Node2D    menu_options_reference_rect    offset_left    offset_top    offset_right    offset_bottom    border_color    border_width    ReferenceRect    reference_rect_boundary_entry    layout_mode    reference_rect_boundary_4    reference_rect_boundary_3    reference_rect_boundary_2    reference_rect_boundary_1    page_label    label_settings    Label    back_button    text    Button    next_button    page_option_button    OptionButton    question_label    view_all_questions    add_question    delete_question    change_question_order    save_question_file    load_question_file    delete_under_three_dialog 	   position    dialog_text    AcceptDialog    add_over_three_hundred_dialog    overwrite_warning    title    file_dialog_save_questions    size    access    FileDialog    file_dialog_load_questions    ok_button_text 
   file_mode 0   _on_reference_rect_boundary_entry_mouse_entered    mouse_entered ,   _on_reference_rect_boundary_4_mouse_entered ,   _on_reference_rect_boundary_3_mouse_entered ,   _on_reference_rect_boundary_2_mouse_entered ,   _on_reference_rect_boundary_1_mouse_entered    _on_back_button_pressed    pressed    _on_next_button_pressed %   _on_page_option_button_item_selected    item_selected    _on_view_all_questions_pressed    _on_add_question_pressed    _on_delete_question_pressed "   _on_change_question_order_pressed    _on_save_question_file_pressed    _on_load_question_file_pressed -   _on_file_dialog_save_questions_file_selected    file_selected ,   _on_file_dialog_load_question_file_selected    	   variants    D                  �@     kC     �C   ��@>��0>��0>  �?            ��     ��     zC    ��C     ��     ��     ��     �C     �C    ��C    �D    ��C     ��     �C    ��C     ��     ��     �C      A     *C     PB               `B     �B     �B      <--      �B     NC      -->      �B     fC     
C     %C     OC              �C     RC    ��C      View All Questions      HC     �B     lC      Add      >C      Delete      mC     �C      Change Order      �C      Save Question File     ��C      Load Question File -   J       '   You cannot have under three questions.    .   You cannot have over three hundred questions.       WARNING       Don't overwrite root folders -   J  �   -   �  �              Open a File       Open       node_count             nodes     m  ��������       ����                      
      ����                                 	                 
      ����                              	              
      ����            
                                
      ����                                            
      ����                                            
      ����                                                   ����                                                   ����                                                   ����                   !            "                     ����            #      $      %                     ����            &            '      (                     ����            )      *      +      ,                     ����            -      .      /      0                     ����      .      -      1      /      2                     ����            3      *      4      5                     ����            +      *      6      7                      ����            6      *      8      9               $   !   ����   "   :   #   ;               $   %   ����   "   :   #   <               $   &   ����   '   =   "   :   #   >               +   (   ����   "   ?   )   @   *   A               +   ,   ����   '   B   "   ?   )   @   -   C   .      *   A             conn_count             conns     p          0   /                     0   1                     0   2                     0   3                     0   4                     6   5              	       6   7              
       9   8                     6   :                     6   ;                     6   <                     6   =                     6   >                     6   ?                     A   @                     A   B                    node_paths              editable_instances              version             RSRCb��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://single_entry.tscn ����d�    Script    res://single_entry_1.gd ��������   PackedScene    res://page_navigation.tscn �Vm�M$      local://PackedScene_0rdl1 z         PackedScene          	         names "         page_of_one_question    Node2D    first_section_outline    custom_minimum_size    offset_left    offset_right    offset_bottom    border_color    editor_only    ReferenceRect    first_section    layout_mode    anchors_preset    Control    single_entry_1_three 	   position    script    page_navigation     _on_first_section_mouse_entered    mouse_entered    	   variants       
    @D  RC     B     %D     RC   ���>��?��?  �?       
    @D                           
     pB   A                  
    �AD  �B      node_count             nodes     A   ��������       ����                	      ����                                                       
   ����                                                   ���   	         
                     ���                         conn_count             conns                                     node_paths              editable_instances              version             RSRC���RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://single_entry.tscn ����d�    Script    res://single_entry_1.gd ��������   Script    res://single_entry_2.gd ��������   PackedScene    res://page_navigation.tscn �Vm�M$      local://PackedScene_oqrdi �         PackedScene          	         names "         page_of_two_questions    Node2D    first_section_outline    custom_minimum_size    offset_left    offset_right    offset_bottom    border_color    editor_only    ReferenceRect    second_section_outline    offset_top    first_section    layout_mode    anchors_preset    Control    second_section    single_entry_1_two 	   position    script    single_entry_2_two    page_navigation     _on_first_section_mouse_entered    mouse_entered !   _on_second_section_mouse_entered    	   variants       
    @D  RC     B     %D     RC   ���>��?��?  �?            �C
    @D                           
     pB   A         
     lB  oC                  
    �AD  �B      node_count             nodes     t   ��������       ����                	      ����                                                    	   
   ����                                                                ����                  	                                       ����            	                                       ���   
                              ���   
                              ���                         conn_count             conns                                                            node_paths              editable_instances              version             RSRC���# Author: Isaac Finehout
# Date: 3 July 2023
# Purpose: Control the title screen for the Air Force game Questions input application
extends Button

# declare num_questions, used throughout the class
var num_questions

# Called when the node enters the scene tree for the first time.
# Hide the confirmation window and disable the button until user enters valid input.
func _ready():
	$confirm_questions.visible = false
	self.text = "Enter Number of Questions"
	self.disabled = true

# the parameter user_input is taken from the line edit, whatever the user inputs.
# is_valid_input is assigned return value of get_is_valid_input
# valid input is any integer between 1-300
# if the input is valid, the button is enabled
func _on_proceed_line_edit_text_changed(user_input):
	var is_valid_input = get_is_valid_input(user_input)
	if (is_valid_input):
		text = "Proceed with %s questions" % num_questions
		self.disabled = false
	else:
		self.disabled = true
		text = "Enter a number of questions between 3 - 300"

# used to determine if the user input is valid, passed user_input,
# and assigns num_customers any valid input
func get_is_valid_input(user_input):
	if (user_input.is_valid_float()):
		num_questions = int(user_input)
		if ((3 < num_questions and num_questions < 301)) :
			return true
	else:
		return false

func _on_pressed():
	$confirm_questions.title = "Confirmation"
	$confirm_questions.dialog_text = "Proceed with " + str(num_questions) + " questions?"
	$confirm_questions.visible = true

func _on_confirm_questions_confirmed():
	# When the user confirms their question numebr, prepare QuestionProfile for the main scene
	QuestionProfile._set_num_questions(num_questions)
	# Start on page 1
	QuestionProfile._set_current_page(1)
	
	# Fill in the questions_and_answers array with empty strings, and option button indices with -1.
	# The state of the empty string is used as a condition to determine if the line edit shows its placeholder or not.
	# -1 indicates that no option is selected.
	var temp_questions_and_answers = []
	for i in QuestionProfile._get_num_questions():
		temp_questions_and_answers.append(["","","","","",-1])
	QuestionProfile._set_questions_and_answers(temp_questions_and_answers)
	get_tree().change_scene_to_file("res://main_dynamic_questions.tscn")
extends Node

# Declare variables
var num_questions: set = _set_num_questions, get = _get_num_questions
var current_question: set = _set_current_question, get = _get_current_question
var num_pages: set = _set_num_pages, get = _get_num_pages
var current_page: set = _set_current_page, get = _get_current_page
var questions_and_answers: set = _set_questions_and_answers, get = _get_questions_and_answers
var current_section
var is_single_entry_2_disabled = false
var is_single_entry_3_disabled = false
const QUESTION = 0
const ANSWER_A = 1
const ANSWER_B = 2
const ANSWER_C = 3
const ANSWER_D = 4
const ANSWER = 5
signal current_page_changed
signal current_question_changed

# Setters
func _set_num_questions(new_num_questions):
	num_questions = new_num_questions
	# There are three questions per page
	# If the number of questions is divisible by three, The number of pages is exactly num_questions / 3
	# Otherwise, 1 must be added to num_questions / 3
	if (QuestionProfile._get_num_questions() % 3 == 0):
		QuestionProfile._set_num_pages(QuestionProfile._get_num_questions() / 3) 
	else:
		QuestionProfile._set_num_pages((QuestionProfile._get_num_questions() / 3) + 1)
func _set_current_question(new_current_question):
	current_question = new_current_question
	emit_signal("current_question_changed")
func _set_num_pages(new_num_pages):
	num_pages = new_num_pages
func _set_current_page(new_current_page):
	current_page = new_current_page
	# If the user is on the last page, and the number of questions they have is not a multiple of three,
	# a special screen must be shown in place of the single_page_of_questions scene, with either one or two questions on the page
	if ((current_page != num_pages) or (num_questions % 3 == 0)):
		# Save computation time by computing the most common case first, and simply passing
		if (is_single_entry_2_disabled or is_single_entry_3_disabled):
			# User is on a page with three entries, re-enable entry 2 and 3
			# Unusual bug described below; notice how entries 2 and 3 are not re-enabled here
			# is_single_entry_2_disabled = false
			# is_single_entry_3_disabled = false
			# The booleans is_single_entry_2_disabled and is_single_entry_3_disabled are set false in their corresponding single_entry ready functions
			# page_navigation.gd takes program control before the single_entry ready functions because of the signal from the back/next/option buttons (in the method PageNavigation.set_first_question_on_page())
			# Setting booleans to true here (commented out above) causes a null instance crash,
			# because page_navigation.gd attempts to reference the single_entries flags before their ready function is called
			get_tree().change_scene_to_file("res://single_page_of_questions.tscn")
		pass
	elif ((current_page == num_pages) and (num_questions % 3 == 1)):
		# User is on the last page with only one question remaining
		is_single_entry_2_disabled = true
		is_single_entry_3_disabled = true
		get_tree().change_scene_to_file("res://page_of_one_question.tscn")
	else:
		# User is on the last page with two questions remaining
		is_single_entry_3_disabled = true
		get_tree().change_scene_to_file("res://page_of_two_questions.tscn")
	emit_signal("current_page_changed")
func _set_questions_and_answers(new_questions_and_answers):
	questions_and_answers = new_questions_and_answers
func _set_current_section(new_current_section):
	current_section = new_current_section
func _set_is_single_entry_2_disabled(new_is_single_entry_2_disabled):
	is_single_entry_2_disabled = new_is_single_entry_2_disabled
func _set_is_single_entry_3_disabled(new_is_single_entry_3_disabled):
	is_single_entry_3_disabled = new_is_single_entry_3_disabled

# Getters
func _get_num_questions():
	return num_questions
func _get_current_question():
	return current_question
func _get_num_pages():
	return num_pages
func _get_current_page():
	return current_page
func _get_questions_and_answers():
	return questions_and_answers
func _get_current_section():
	return current_section

	#TODO Delete
func _get_is_single_entry_2_disabled():
	return is_single_entry_2_disabled
func _get_is_single_entry_3_disabled():
	return is_single_entry_3_disabled
func _ready():
	pass
	# TODO change
#	QuestionProfile._set_num_questions(8)
#	QuestionProfile._set_num_pages(3)
#	QuestionProfile._set_current_page(1)
#	QuestionProfile._set_current_question(1)
	
#	get_tree().get_root().find_child("first_section_outline", true, false).editor_only = false
#	get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true
#	get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true


	# When I delete the TODOs decide whether I want to assign initial; QuestionProfile attributes here or in main_dynamic_questions
	#TODO delete
#	var temp_array = []
#	for i in 299:
#		temp_array.append(["","","","","",-1])
#	QuestionProfile._set_questions_and_answers(temp_array)
#	QuestionProfile.questions_and_answers = [
#	["Since the birth of our Nation policies and directives have been made by:","the Joint Staff","military leaders","civilians assigned to the military and the executive and legislative branches","the Chairman of the Joint Chiefs of Staff with the advice and consent of the senate",3],
#	["What establishes the basic principle of civilian control of the U.S. Armed Forces?","the U.S. Constitution","the Law of Armed Conflict","the British Articles of War","the Uniform Code of Military Justice",1],
#	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces beginning with the President's role as:","Commander in Chief","Secretary of Defense","head of the legislative and judicial branches","liaison to the Secretary of Defense for Policy",1],
#	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces. Who serves as Commander in Chief and has final command authority?","the President","the Secretary of State","the Secretary of Defense","the Chairman Joint Chiefs of Staff",1],
#	["The President serves as Commander in Chief of the Armed Forces and has final command authority. However as head of the executive branch he is subject to the checks and balances system of:","the legislative and judicial branches","the Armed Forces Policy Council","the Uniform Code of Military Justice","the Department of Defense and Secretary of Defense",3],
#	["By statute the chain of command runs from the President through the Secretary of Defense to:","the Combatant Commanders","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff","the Secretaries of the military departments",1],
#	["When forces are assigned to the Combatant Commanders administrative control over those forces still typically flows through:","the Combatant Commanders","their respective service branch","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff",2],
#	["Although the chain of command runs from the President through the Secretary of Defense to the Combatant Commanders a provision of this law permits the President to authorize communications through the Chairman Joint Chiefs of Staff placing the Chairman in the communications chain of command.","Key West Agreement","Air Force Letter 35.3","National Security Act of 1947","Goldwater-Nichols DoD Reorganization Act of 1986",4]
#	]
#	QuestionProfile.questions_and_answers = [
#	["What is your favorite pizza topping?", "Mushroom", "Pepperoni", "Cheese", "Sausage", 1],
#	["What is the capital of France?", "Paris", "London", "Berlin", "Madrid", 2],
#	["What is the color of the sun?", "Yellow", "Blue", "Red", "Green", 3],
#	["Who wrote the play 'Hamlet'?", "William Shakespeare", "Jane Austen", "Charles Dickens", "Mark Twain", 4],
#	["What is the chemical symbol for water?", "H2O", "CO2", "NaCl", "O2", 1],
#	["What is the largest planet in our solar system?", "Jupiter", "Mars", "Saturn", "Neptune", 2],
#	["What is the tallest mountain in the world?", "Mount Everest", "K2", "Makalu", "Kangchenjunga", 2],
#	["Who painted the Mona Lisa?", "Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Claude Monet", 4],
#	["What is the largest ocean on Earth?", "Pacific Ocean", "Atlantic Ocean", "Indian Ocean", "Arctic Ocean", 1],
#	["What is the chemical symbol for gold?", "Au", "Ag", "Cu", "Fe", 3],
#	["Who discovered penicillin?", "Alexander Fleming", "Marie Curie", "Albert Einstein", "Isaac Newton", 4],
#	["What is the largest country by land area?", "Russia", "Canada", "China", "United States", 1],
#	["Who wrote the play 'Romeo and Juliet'?", "William Shakespeare", "Arthur Miller", "Tennessee Williams", "Henrik Ibsen", 2],
#	["What is the largest desert in the world?", "Sahara Desert", "Gobi Desert", "Atacama Desert", "Antarctica", 4],
#	["What is the symbol for the element oxygen?", "O", "H", "C", "N", 1],
#	["Who painted the famous artwork 'The Starry Night'?", "Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Salvador Dalí", 3],
#	["What is the capital of Japan?", "Tokyo", "Beijing", "Seoul", "Bangkok", 2],
#	["What is the capital of Japan?", "Tokyo", "Beijing", "Seoul", "Bangkok", 2]
#	]
	#TODO Delete

#TODO CHANGE TO JSON ASK CHATGPT GODOT METHOD TO MAKE JSON FILE WITH ARRAY FOR PARSDING urgent TODO
func questions_and_answers_to_string(questions_and_answers_array) -> String:
	questions_and_answers_array = QuestionProfile._get_questions_and_answers()
	#change the question_and_answers array into a string for saving and loading
	var question_and_answer_string = "[["
	# Use a for loop to save the multidimensional array to a file
	var i = 0
	var j
	for question_and_answer in questions_and_answers:
		j = 0
		for element in question_and_answer:
			question_and_answer_string += str(element)
			if (j < 5):
				# Don't put a comma after the last element
				question_and_answer_string += ","
			j += 1
		if (i < len(questions_and_answers_array) - 1):
			# Only put two brackets after the very last entry
			question_and_answer_string += "],["
		i += 1
	question_and_answer_string += "]]"
	return question_and_answer_string

func questions_and_answers_to_array(questions_and_answers_string: String):
	var questions_and_answers_array = []
	var num_open_brackets: int = questions_and_answers_string.count("[")
	var num_close_brackets: int = questions_and_answers_string.count("]")
	var num_brackets: int = num_open_brackets + num_close_brackets
	var num_nested_arrays: int = (num_brackets - 2) / 2
	
	# Remove the beginning and ending brackets
	var first_bracket_index: int = questions_and_answers_string.find("[", 0)
	var length_string = len(questions_and_answers_string)
	questions_and_answers_string = questions_and_answers_string.substr(first_bracket_index + 1, (len(questions_and_answers_string) - first_bracket_index) )
	# Continue removing the last index until a combination of closing brackets no longer exist, to remove the last bracket
	while (check_for_closing_brackets(questions_and_answers_string)):
		questions_and_answers_string = questions_and_answers_string.substr(0, len(questions_and_answers_string) - 1)
	
	# Use a for loop to set up the questions_and_answers array
	for i in num_nested_arrays:
		questions_and_answers_array.append([])
		for j in 6:
			if (j != 5):
				questions_and_answers_array[i].append("")
			else:
				# Append -1 at the very end
				questions_and_answers_array[i].append(0)
	
	# Declare variables to fill in the array
	var open_bracket_index: int
	var close_bracket_index: int
	var old_comma_index: int
	var new_comma_index: int
	var i: int = 0
	# While nested arrays still exist in the string
		# Load the elements into the array, and cut off that element from the string
	while (i < num_nested_arrays):
		
		# Find QUESTION
		open_bracket_index = questions_and_answers_string.find("[")
		new_comma_index = questions_and_answers_string.find(",")
		questions_and_answers_array[i][QuestionProfile.QUESTION] = questions_and_answers_string.substr(open_bracket_index + 1, (new_comma_index - 1))
		questions_and_answers_string = questions_and_answers_string.substr(new_comma_index)
		
		# Find ANSWER_A, ANSWER_B, ANSWER_C, and ANSWER_D
		for j in 4:
			old_comma_index = questions_and_answers_string.find(",")
			new_comma_index = questions_and_answers_string.find(",", 1)
			questions_and_answers_array[i][j+1] = questions_and_answers_string.substr(old_comma_index + 1, new_comma_index - 1)
			questions_and_answers_string = questions_and_answers_string.substr(new_comma_index)
		
		# Find ANSWER
		questions_and_answers_array[i][QuestionProfile.ANSWER] = int(questions_and_answers_string[1])
		open_bracket_index = questions_and_answers_string.find("[")
		questions_and_answers_string = questions_and_answers_string.substr(open_bracket_index)
		i += 1
	return questions_and_answers_array

func check_for_closing_brackets(questions_and_answers_string: String) -> bool:
	var i: int = 0
	# TODO Delete bracket count
	var bracket_count: int = 0
	for character_i in questions_and_answers_string:
		if (character_i == "]"):
			bracket_count += 1
			# Final closing brackets will only appear in the last index
			if (i + 1 == len(questions_and_answers_string)):
				# Only spaces should appear between the last bracket and the preceading closing bracket
				for character_j in (reverse_string(questions_and_answers_string).substr(1, len(questions_and_answers_string) ) ):
					if ( (character_j != " " and character_j != "]") ):
						# Something other than a space or bracket appeared before closing bracket, so it is not the last bracket
						break
					if (character_j == "]"):
						# Another bracket in the reversed string, meaning the bracket is the last closing bracket
						return true
		i += 1
	return false

func reverse_string(questions_and_answers_string: String) -> String:
	var reverse = questions_and_answers_string
	var i: int = len(questions_and_answers_string)
	i -= 1
	for character in questions_and_answers_string:
		reverse[i] = character
		i -= 1
	return reverse

func get_is_questions_and_answers_valid(questions_and_answers_string: String) -> bool:
	# Check to see if the questions and answers multidimensional array is valid
	
	# The brackets should be >= 8 (3 question minimum) and <= 602 (300 question maximum)
	var num_open_brackets: int = questions_and_answers_string.count("[")
	var num_close_brackets: int = questions_and_answers_string.count("]")
	if ( (4 >= num_open_brackets) and (num_open_brackets >= 301) ):
		show_warning_dialog("Invalid Left Bracket Number. Operation failed.")
		return false
	
	if ((4 >= num_close_brackets) and (num_close_brackets >= 301)):
		show_warning_dialog("Invalid Right Bracket Number. Operation failed.")
		return false
	
	if (num_open_brackets != num_close_brackets):
		show_warning_dialog("Brackets Are Unequal. Operation failed.")
		return false
	
	# The num_commas will always the algebraic expression below (using num_brackets)
	var num_brackets: int = num_open_brackets + num_close_brackets
	# The number of single entries, or number of nested arrays. Subtract two for the outer array brackets, then divide by two for two brackets surrounding each array
	var num_nested_arrays: int = (num_brackets - 2) / 2
	#				one comma between each entry	4 commas inside of each entry
	var num_commas = ( (num_nested_arrays - 1) + ( num_nested_arrays * 5) )
	var actual_num_commas = questions_and_answers_string.count(",")
	if (not(num_commas == actual_num_commas)):
			show_warning_dialog("Invalid Comma Number. Operation failed.")
			return false
	
	# The very first character should be an opening bracket
	if (questions_and_answers_string[0] != "["):
		show_warning_dialog("First Character Not A Bracket. Operation failed.")
		return false
	
	# The very last character should be a closing bracket
	if (questions_and_answers_string[-1] != "]"):
		show_warning_dialog("Last Character Not A Bracket. Operation failed.")
		return false
	
	# The last two closing brackets should be within four indices of the length
	# Additionally, every closing bracket except for the last two should have a comma following it
	var count = 0
	for character in questions_and_answers_string:
		if (count < (len(questions_and_answers_string) - 5)):
			if ((character == "]") and (questions_and_answers_string[count + 1] != ",")):
				show_warning_dialog("Invalid Bracket And Comma Pairing(s). Operation failed.")
				return false
		count += 1

	# Every even numbered quotation mark should have a comma after itself
	# Need to add quotation marks in the _to_string method first
	# Add HTML tags too
#	var quotation_mark_count = 0
#	count = 0
#	for character in questions_and_answers_string:
#		if (character == '"'):
#			quotation_mark_count += 1
#			if (quotation_mark_count % 2 == 0):
#				if (questions_and_answers_string[count + 1] != ","):
#					show_warning_dialog("Invalid Even Quote And Comma Pairing(s). Operation failed.")
#					return false
#		count += 1

	# Finally, attempt to change the string to an array, and check the validity of the contents.
	var questions_and_answers_array = QuestionProfile.questions_and_answers_to_array(questions_and_answers_string)
	
	var question_number = 1
	for question_and_answer in questions_and_answers_array:
		if (question_and_answer[QuestionProfile.QUESTION] == ""):
			show_warning_dialog("Question %d Question Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_A] == ""):
			show_warning_dialog("Question %d Answer_A Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_B] == ""):
			show_warning_dialog("Question %d Answer_B Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_C] == ""):
			show_warning_dialog("Question %d Answer_C Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_D] == ""):
			show_warning_dialog("Question %d Answer_D Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER] == 0):
			show_warning_dialog("Question %d Question Was Left Unanswered. Operation failed."%[question_number])
			return false
		question_number += 1
	# The questions_and_answers_string passed all tests, and so did its array
	# Return true
	return true

func show_warning_dialog(dialog_string: String):
				get_tree().get_root().find_child("warning_dialog", true, false).dialog_text = dialog_string
				get_tree().get_root().find_child("warning_dialog", true, false).visible = true
RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://test_script.gd ��������      local://PackedScene_m1iui          PackedScene          	         names "         testing_code_DELETEME    script    Node2D    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://button_group.gd ��������   Script    res://line_edit_group.gd ��������      local://LabelSettings_j0akd �         local://PackedScene_uyhpa 4         LabelSettings                   ��?��?��?  �?         PackedScene          	         names "   -      single_entry 	   position    Node2D    button_group    layout_mode    anchors_preset    offset_right    offset_bottom    script    Control    answer_button_a    offset_left    offset_top    CheckButton    answer_button_b    answer_button_c    answer_button_d    line_edit_group 	   question    placeholder_text 	   LineEdit 	   answer_a 	   answer_b 	   answer_c 	   answer_d    question_label    label_settings    Label     _on_answer_button_a_button_down    button_down     _on_answer_button_b_button_down     _on_answer_button_c_button_down     _on_answer_button_d_button_down    _on_question_mouse_entered    mouse_entered    _on_question_text_changed    text_changed    _on_answer_a_mouse_entered    _on_answer_a_text_changed    _on_answer_b_mouse_entered    _on_answer_b_text_changed    _on_answer_c_mouse_entered    _on_answer_c_text_changed    _on_answer_d_mouse_entered    _on_answer_d_text_changed    	   variants    %   
     <C  �@                   B               �@     @B     �B     �B     �B     �B     C     C     ,C             �	D     �A   	   question      LB     B    �	D     �B   	   answer a      �B     �B   	   answer b      �B     C   	   answer c      C     /C   	   answer d      4�     �B     �@     $C                node_count             nodes     �   ��������       ����                      	      ����                                               
   ����                                                  ����                              	                    ����                  
                                ����                                             	      ����                                                  ����                                            ����                                                        ����                                                        ����                                                        ����                                                         ����             !      "      #      $             conn_count             conns     b                                                                                                      "   !                    $   #                    "   %                    $   &              	      "   '              	      $   (              
      "   )              
      $   *                    "   +                    $   ,                    node_paths              editable_instances              version             RSRC�wH�>A����c%# Author: Isaac Finehout
# Date: 7 July 2023
# Purpose: Control data for the line_edits inside of the question pages
# current_question starts at 1 and is subtracted by 2 in the current_question formula

extends Node2D

# The local variable current_question is for each single entry specifically
signal release_all_focus
var current_question : int

# Set the question_label and text boxes for the scene
func _ready():
	# Set current_question
	current_question = ((QuestionProfile._get_current_page())*3 - 3)
	# Connect the signal to change the line edits according to the questions_and_answers array
	var callable_on_current_page_changed = Callable(self, "_on_current_page_changed")
	QuestionProfile.connect("current_page_changed", callable_on_current_page_changed)
	# Set the question_label text
	$question_label.text = "%d" % [current_question + 1]
	# Set the line edits and the buttons
	set_line_edits()
	set_option_buttons()
	# This line keeps the highlight on the first section when the user deletes the very last question on single_page_of_question and is returned to single_page_of_questions
	_on_first_section_mouse_entered()

# If questions and answers do not exist in the QuestionProfile.questions_and_answers->
#     leave the placeholder text in
# Otherwise, fill in with what the user already entered
func set_line_edits():
	var count = 0
	var line_edit_group = [$line_edit_group/question, $line_edit_group/answer_a
						 , $line_edit_group/answer_b, $line_edit_group/answer_c
						 , $line_edit_group/answer_d]
	for line_edit in line_edit_group:
		if (QuestionProfile._get_questions_and_answers()[current_question][count] == ""):
			# If user hasn't entered anything, leave the placeholder text
			line_edit.text = ""
		else:
			# If user has entered data, fill it in
			line_edit.text = QuestionProfile._get_questions_and_answers()[current_question][count]
		count += 1

# If the ANSWER index (index 5) is -1
#     leave all options unselected
# Otherwise, choose the user's option
func set_option_buttons():
	var option_button_group = [$button_group/answer_button_a, $button_group/answer_button_b
							 , $button_group/answer_button_c, $button_group/answer_button_d]
	if (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER] == -1):
		for option_button in option_button_group:
			option_button.button_pressed = false
	else:
		# Godot's switch statement
		match (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER]):
			QuestionProfile.ANSWER_A:
				option_button_group[0].button_pressed = true
			QuestionProfile.ANSWER_B:
				option_button_group[1].button_pressed = true
			QuestionProfile.ANSWER_C:
				option_button_group[2].button_pressed = true
			QuestionProfile.ANSWER_D:
				option_button_group[3].button_pressed = true

# When the setter function from QuestionProfile is called, it emits the current_page_changed signal
func _on_current_page_changed():
	current_question = ((QuestionProfile._get_current_page())*3 - 3)
	$question_label.text = "%d" % [current_question + 1]
	set_line_edits()
	set_option_buttons()

# When the player enters the first section, set the correct current_question
func _on_first_section_mouse_entered():
	# If user comes from another section, remove focus from the old section
	# Ensures a user can't move the mouse into a different question and type, causing a bug where questions are placed incorrectly in the array
	if (QuestionProfile._get_current_section() != 1):
		# Sends a signal to all the line_edit_group script to release focus
		emit_signal("release_all_focus")
	get_tree().get_root().find_child("first_section_outline", true, false).editor_only = false
	if (not(QuestionProfile._get_is_single_entry_2_disabled())):
		# Don't make references to either single entry 2 or 3 if they are disabled
		get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true
		if (not(QuestionProfile._get_is_single_entry_3_disabled())):
			get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true
	QuestionProfile._set_current_section(1)
	QuestionProfile._set_current_question(current_question)
Y����i2g��9-# Author: Isaac Finehout
# Date: 7 July 2023
# Purpose: Control data for the line_edits inside of the question pages
# current_question starts at 2 and is subtracted by 1 in the current_question formula

extends Node2D

# The local variable current_question is for each single entry specifically
signal release_all_focus
var current_question : int

# Set the question_label and text boxes for the scene
func _ready():
	# Set current_question
	current_question = ((QuestionProfile._get_current_page())*3 - 2)
	# Ensure single_entry_2 is not disabled
	QuestionProfile._set_is_single_entry_2_disabled(false)
	# Connect the signal to change the line edits according to the questions_and_answers array
	var callable_on_current_page_changed = Callable(self, "_on_current_page_changed")
	QuestionProfile.connect("current_page_changed", callable_on_current_page_changed)
	$question_label.text = "%d" % [current_question + 1]
	# Set the line edits and the buttons
	set_line_edits()
	set_option_buttons()
	# Always give focus to first section when exitting from page_of_two_questions or page_of_one_question
	get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true

# If questions and answers do not exist in the QuestionProfile.questions_and_answers->
#     leave the placeholder text in
# Otherwise, fill in with what the user already entered
func set_line_edits():
	var count = 0
	var line_edit_group = [$line_edit_group/question, $line_edit_group/answer_a
						 , $line_edit_group/answer_b, $line_edit_group/answer_c
						 , $line_edit_group/answer_d]
	for line_edit in line_edit_group:
		if (QuestionProfile._get_questions_and_answers()[current_question][count] == ""):
			# If user hasn't entered anything, leave the placeholder text
			line_edit.text = ""
		else:
			# If user has entered data, fill it in
			line_edit.text = QuestionProfile._get_questions_and_answers()[current_question][count]
		count += 1

# If the ANSWER index (index 5) is -1
#     leave all options unselected
# Otherwise, choose the user's option
func set_option_buttons():
	var option_button_group = [$button_group/answer_button_a, $button_group/answer_button_b
							 , $button_group/answer_button_c, $button_group/answer_button_d]
	if (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER] == -1):
		for option_button in option_button_group:
			option_button.button_pressed = false
	else:
		# Godot's switch statement
		match (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER]):
			QuestionProfile.ANSWER_A:
				option_button_group[0].button_pressed = true
			QuestionProfile.ANSWER_B:
				option_button_group[1].button_pressed = true
			QuestionProfile.ANSWER_C:
				option_button_group[2].button_pressed = true
			QuestionProfile.ANSWER_D:
				option_button_group[3].button_pressed = true

# When the setter function from QuestionProfile is called, it emits the current_page_changed signal
func _on_current_page_changed():
	if (not(QuestionProfile._get_is_single_entry_2_disabled())):
		current_question = ((QuestionProfile._get_current_page())*3 - 2)
		$question_label.text = "%d" % [current_question + 1]
		set_line_edits()
		set_option_buttons()

# When the player enters the second section, set the correct current_question
func _on_second_section_mouse_entered():
	if (not(QuestionProfile._get_is_single_entry_2_disabled())):
		# If user comes from another section, remove focus from the old section
		# Ensures a user can't move the mouse into a different question and type, causing a bug where questions are placed incorrectly in the array
		if (QuestionProfile._get_current_section() != 2):
			emit_signal("release_all_focus")
		get_tree().get_root().find_child("first_section_outline", true, false).editor_only = true
		get_tree().get_root().find_child("second_section_outline", true, false).editor_only = false
		if (not(QuestionProfile._get_is_single_entry_3_disabled())):
			# If single_entry_three is disabled, do not make a reference to it
			get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true
		QuestionProfile._set_current_section(2)
		QuestionProfile._set_current_question(current_question)
��?Ӌ�D��# Author: Isaac Finehout
# Date: 7 July 2023
# Purpose: Control data for the line_edits inside of the question pages
# current_question starts at 3 and is subtracted by nothing in the current_question formula

extends Node2D

# The local variable current_question is for each single entry specifically
signal release_all_focus
var current_question : int

# Set the question_label and text boxes for the scene
func _ready():
	# Set current_question
	current_question = ((QuestionProfile._get_current_page())*3 - 1)
	# Ensure single_entry_3 is not disabled
	QuestionProfile._set_is_single_entry_3_disabled(false)
	# Connect the signal to change the line edits according to the questions_and_answers array
	var callable_on_current_page_changed = Callable(self, "_on_current_page_changed")
	QuestionProfile.connect("current_page_changed", callable_on_current_page_changed)
	$question_label.text = "%d" % [current_question + 1]
	# Set the line edits and the buttons
	set_line_edits()
	set_option_buttons()
	# Always give focus to first section when exitting from page_of_two_questions or page_of_one_question
	get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true

# If questions and answers do not exist in the QuestionProfile.questions_and_answers->
#     leave the placeholder text in
# Otherwise, fill in with what the user already entered
func set_line_edits():
	var count = 0
	var line_edit_group = [$line_edit_group/question, $line_edit_group/answer_a
						 , $line_edit_group/answer_b, $line_edit_group/answer_c
						 , $line_edit_group/answer_d]
	for line_edit in line_edit_group:
		# Subtract one for array indexing
		if (QuestionProfile._get_questions_and_answers()[current_question][count] == ""):
			# If user hasn't entered anything, leave the placeholder text
			line_edit.text = ""
		else:
			# If user has entered data, fill it in
			line_edit.text = QuestionProfile._get_questions_and_answers()[current_question][count]
		count += 1

# If the ANSWER index (index 5) is -1
#     leave all options unselected
# Otherwise, choose the user's option
func set_option_buttons():
	var option_button_group = [$button_group/answer_button_a, $button_group/answer_button_b
							 , $button_group/answer_button_c, $button_group/answer_button_d]
	# Subtract one for indexing in arrays
	if (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER] == -1):
		for option_button in option_button_group:
			option_button.button_pressed = false
	else:
		# Godot's switch statement
		match (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER]):
			QuestionProfile.ANSWER_A:
				option_button_group[0].button_pressed = true
			QuestionProfile.ANSWER_B:
				option_button_group[1].button_pressed = true
			QuestionProfile.ANSWER_C:
				option_button_group[2].button_pressed = true
			QuestionProfile.ANSWER_D:
				option_button_group[3].button_pressed = true

# When the setter function from QuestionProfile is called, it emits the current_page_changed signal
func _on_current_page_changed():
	if (not(QuestionProfile._get_is_single_entry_3_disabled())):
		current_question = ((QuestionProfile._get_current_page())*3 - 1)
		$question_label.text = "%d" % [current_question + 1]
		set_line_edits()
		set_option_buttons()

# When the player enters the third section, set the correct current_question
func _on_third_section_mouse_entered():
	if (not(QuestionProfile._get_is_single_entry_3_disabled())):
		# If user comes from another section, remove focus from the old section
		# Ensures a user can't move the mouse into a different question and type, causing a bug where questions are placed incorrectly in the array
		if (QuestionProfile._get_current_section() != 3):
			emit_signal("release_all_focus")
		get_tree().get_root().find_child("first_section_outline", true, false).editor_only = true
		get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true
		get_tree().get_root().find_child("third_section_outline", true, false).editor_only = false
		QuestionProfile._set_current_section(3)
		QuestionProfile._set_current_question(current_question)
�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://single_entry.tscn ����d�    Script    res://single_entry_1.gd ��������   Script    res://single_entry_2.gd ��������   Script    res://single_entry_3.gd ��������   PackedScene    res://page_navigation.tscn �Vm�M$      local://PackedScene_bsb8a �         PackedScene          	         names "         single_page_of_questions    Node2D    first_section_outline    custom_minimum_size    offset_left    offset_right    offset_bottom    border_color    editor_only    ReferenceRect    second_section_outline    offset_top    third_section_outline    first_section    layout_mode    anchors_preset    Control    second_section    third_section    single_entry_1 	   position    script    single_entry_2    single_entry_3    page_navigation    warning_dialog    AcceptDialog     _on_first_section_mouse_entered    mouse_entered !   _on_second_section_mouse_entered     _on_third_section_mouse_entered    	   variants       
    @D  RC     B     %D     RC   ���>��?��?  �?            �C    �"D
    @D                           
     pB   A         
     lB  oC         
     lB  �C                  
    �AD  �B-   J          node_count             nodes     �   ��������       ����                	      ����                                                    	   
   ����                                                          	      ����                                                         ����            	      
                                       ����      	      
                                             ����      	      
                                       ���                                 ���                                 ���                                 ���                                 ����                   conn_count             conns                                                         	                          node_paths              editable_instances              version             RSRC/��extends Node2D

func _ready():
	var test_string
	test_string = "[[What is your favorite pizza topping?,Mushroom,Pepperoni,Cheese,Sausage,2],[What is the capital of France?,Paris,London,Berlin,Madrid,2],[What is the color of the sun?,Yellow,Blue,Red,Green,3],[Who wrote the play 'Hamlet'?,William Shakespeare,Jane Austen,Charles Dickens,Mark Twain,4],[What is the chemical symbol for water?,H2O,CO2,NaCl,O2,1],[What is the largest planet in our solar system?,Jupiter,Mars,Saturn,Neptune,2],[What is the tallest mountain in the world?,Mount Everest,K2,Makalu,Kangchenjunga,2],[Who painted the Mona Lisa?,Leonardo da Vinci,Pablo Picasso,Vincent van Gogh,Claude Monet,4],[What is the largest ocean on Earth?,Pacific Ocean,Atlantic Ocean,Indian Ocean,Arctic Ocean,1],[What is the chemical symbol for gold?,Au,Ag,Cu,Fe,3],[Who discovered penicillin?,Alexander Fleming,Marie Curie,Albert Einstein,Isaac Newton,4],[What is the largest country by land area?,Russia,Canada,China,United States,1],[Who wrote the play 'Romeo and Juliet'?,William Shakespeare,Arthur Miller,Tennessee Williams,Henrik Ibsen,2],[What is the largest desert in the world?,Sahara Desert,Gobi Desert,Atacama Desert,Antarctica,4],[What is the symbol for the element oxygen?,O,H,C,N,1],[Who painted the famous artwork 'The Starry Night'?,Vincent van Gogh,Pablo Picasso,Leonardo da Vinci,Salvador Dalí,3],[What is the capital of Japan?,Tokyo,Beijing,Seoul,Bangkok,2],[What is the capital of Japan?,Tokyo,Beijing,Seoul,Bangkok,2]]"
	print(QuestionProfile.get_is_questions_and_answers_valid(test_string))
	print("END=====================================")
�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://test_scene_DELETEME.gd ��������      local://PackedScene_uqkrl          PackedScene          	         names "         test_scene_DELETEME    script    Node2D    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC��gFqb��)KRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://all_questions.gd ��������      local://PackedScene_xwqyn          PackedScene          	         names "          view_all_questions    Node2D    scroll_container    offset_left    offset_right    offset_bottom    ScrollContainer    all_questions    custom_minimum_size    layout_mode    script    Control    return    offset_top    text    Button    not_has_entered_questions 	   position    dialog_text    AcceptDialog    go_to_question    OptionButton    _on_scroll_container_gui_input 
   gui_input "   _on_scroll_container_scroll_ended    scroll_ended $   _on_scroll_container_scroll_started    scroll_started    _on_return_pressed    pressed !   _on_go_to_question_item_selected    item_selected    	   variants            �@     �D    �!D
    ��D  �A                            aD     �A    ��D     �B      Return to questions -   �   �      P   You haven't entered any questions! Return to the main page and enter questions.      �B      node_count             nodes     P   ��������       ����                      ����                                       ����         	      
                       ����   	                     	      
                          ����                                ����   	               
      	                   conn_count             conns     #                                                                                                                            node_paths              editable_instances              version             RSRC�[remap]

path="res://.godot/exported/133200997/export-8c54ee64c9f5cc1c1bba531cc7989390-ask_for_number_of_questions.scn"
�f�";�B[remap]

path="res://.godot/exported/133200997/export-db35dc3d9bcf75b168b70cf62b7ec40e-main_dynamic_questions.scn"
��͠�n~a�ks�[remap]

path="res://.godot/exported/133200997/export-c02dfd1018b0ee82b97108aea0a8a5a8-page_navigation.scn"
�	[remap]

path="res://.godot/exported/133200997/export-0fa6ce60882eff8c9ed70ecfbe6d1c3f-page_of_one_question.scn"
x��N�d!}��[remap]

path="res://.godot/exported/133200997/export-954bd05a74def8d58b9b4cdaaa40921b-page_of_two_questions.scn"
<?�0M����%L[remap]

path="res://.godot/exported/133200997/export-96ce2d657223e135dea58a26ffd349ea-testing_code_deleteme.scn"
qg�9�?Wd�-�HyS[remap]

path="res://.godot/exported/133200997/export-7511a1c6d17660ce99f7a35eed0c96fd-single_entry.scn"
R�I��\[remap]

path="res://.godot/exported/133200997/export-aeecf76b1149ea9c17dfa8228fedcb18-single_page_of_questions.scn"
��rQ�����[remap]

path="res://.godot/exported/133200997/export-ec2bbcdf9d54d6a57a344639e373b587-test_scene_deleteme.scn"
[remap]

path="res://.godot/exported/133200997/export-17003bc07ef07d3a2b97f0d635135c91-view_all_questions.scn"
�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
A]   Y�����o&   res://ask_for_number_of_questions.tscn���ܙf#   res://icon.svg���8�~v!   res://main_dynamic_questions.tscn�Vm�M$   res://page_navigation.tscn��C/   res://page_of_one_question.tscn�wzJ�@    res://page_of_two_questions.tscn����d�    res://single_entry.tscn�4���o]#   res://single_page_of_questions.tscn���Y3��    res://testing_code_deleteme.tscnx<�[�q�0   res://test_scene_deleteme.tscn�7^��U�+   res://view_all_questions.tscn8JV�]�    res://testing_code_deleteme.tscn�@ �4�'L�ECFG      application/config/name         Dynamic Questions      application/run/main_scene0      &   res://ask_for_number_of_questions.tscn     application/config/features$   "         4.0    Forward Plus       application/config/icon         res://icon.svg     autoload/QuestionProfile$         *res://question_profile.gd  ��^�^Xd��