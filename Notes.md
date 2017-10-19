Pencil Durability Kata

 User Stories
 ------------
 1) As a *writer*
	I want to be able use a pencil to write text on a sheet of paper
	so that I can better remember my thoughts
	
 2) As a *pencil manufacturer*
	I want writing to cause a pencil point to go dull
	so that I can sell more pencils
	
 3) As a *writer*
	I want to be able to sharpen my pencil
	so that I can continue to write with it after it goes dull
	
 4) As a *writer*
	I want to be able to erase previously written text
	so that I can remove my mistakes
	
 5) As a *pencil manufacturer*
	I want a pencil eraser to eventually wear out
	so that I can sell more pencils
	
 6) As a *writer*
	I want to be able edit previously written text
	so that I can change my writing without starting over

 Main Features
 -------------
 1) Write
 
 2) Point Degradation
 
 3) Sharpen
 
 4) Erase 
 
 5) Eraser Degradation
 
 6) Editing 
 

 ------------
 
 Pencil
	attributes:
		(int) pencil_length
	        (int) point_durability, MAX_DURABILITY
		(int) eraser_durability
	
	methods:
		initialize with pencil_length, pencil_durability, eraser_durability
		
		
		decrease_pencil_durability(n)
			--this method decreases pencil durability by n amount
		
		
		 decrease_eraser_durability(n)
			--decrease eraser durability by n amount
		
		sharpen()
			--decreases pencil length
			--resets pencil_durability
			
 Paper 

	attributes:
		(string) paper_text
	
	methods: 
		initialize with an empty paper_text
		
		write(user_input)
			--this method should write user input on the paper
			--decrease the pencil_durability(n)

		erase(word)
			--erases the word chosen
			--decrease eraser_durability(n)

		edit(word)
			--edits the paper with the word given where a previous word was erased
			--decrease_pencil_durability(n)
