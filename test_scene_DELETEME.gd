extends Node2D

func _ready():
	var test_string
	test_string = "[[What is your favorite pizza topping?,Mushroom,Pepperoni,Cheese,Sausage,2],[What is the capital of France?,Paris,London,Berlin,Madrid,2],[What is the color of the sun?,Yellow,Blue,Red,Green,3],[Who wrote the play 'Hamlet'?,William Shakespeare,Jane Austen,Charles Dickens,Mark Twain,4],[What is the chemical symbol for water?,H2O,CO2,NaCl,O2,1],[What is the largest planet in our solar system?,Jupiter,Mars,Saturn,Neptune,2],[What is the tallest mountain in the world?,Mount Everest,K2,Makalu,Kangchenjunga,2],[Who painted the Mona Lisa?,Leonardo da Vinci,Pablo Picasso,Vincent van Gogh,Claude Monet,4],[What is the largest ocean on Earth?,Pacific Ocean,Atlantic Ocean,Indian Ocean,Arctic Ocean,1],[What is the chemical symbol for gold?,Au,Ag,Cu,Fe,3],[Who discovered penicillin?,Alexander Fleming,Marie Curie,Albert Einstein,Isaac Newton,4],[What is the largest country by land area?,Russia,Canada,China,United States,1],[Who wrote the play 'Romeo and Juliet'?,William Shakespeare,Arthur Miller,Tennessee Williams,Henrik Ibsen,2],[What is the largest desert in the world?,Sahara Desert,Gobi Desert,Atacama Desert,Antarctica,4],[What is the symbol for the element oxygen?,O,H,C,N,1],[Who painted the famous artwork 'The Starry Night'?,Vincent van Gogh,Pablo Picasso,Leonardo da Vinci,Salvador Dalí,3],[What is the capital of Japan?,Tokyo,Beijing,Seoul,Bangkok,2],[What is the capital of Japan?,Tokyo,Beijing,Seoul,Bangkok,2]]"
	print(QuestionProfile.get_is_questions_and_answers_valid(test_string))
	print("END=====================================")
