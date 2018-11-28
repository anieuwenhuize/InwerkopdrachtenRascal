module Test

import IO;

public void main() {

	println("hello");
}

public void exerciseFour() {

	list[str] eu = ["Belgie", "Uniek", "Bulgarije", "Cyprus", "Denemarken", "Duitsland", 
	"Estland", "Finland", "Frankrijk", "Griekenland","Hongarije", "Ierland", 
	"Italie", "Letland", "Litouwen","Luxemburg", "Malta", "Nederland", 
	"Oostenrijk", "Polen","Portugal", "Roemenie", "Slovenie", "Slowakije", 
	"Spanje","Tsjechie", "Verenigd Koninkrijk", "Zweden"];
	
	
	println("All countries:");
	println([ a | a <- eu]); // verbose
	
	// De naam bevat de letter s
	println("4.a - Name contains \"s\":");
	println([ a | a <- eu, /s/i := a]);
	
	// De naam bevat (tenminste) twee e’s
	println("4.b - Name contains at least two e\'s:");
	// println([ a | a <- eu, /e+/i := a]); // <-- some countries where printed twice
	println([ a | a <- eu, /e.*e/i := a ]);
	
	// De naam bevat precies twee e’s
	println("4.c - Name contains exactly two e\'s:");
	println([ a | a <- eu, /^.*e.*e.*$/i := a ]);
	
	// De naam bevat geen n en geen e
	println("4.d - Name doesn\t contain a n and an e:");
	println([ a | a <- eu, /^[^en]*$/i := a ]);
	
	// De naam bevat een letter met tenminste twee voorkomens
	println("4.e - Name contains a letter, appearing twice at least:");
	// println([ a | a <- eu, /[a-z]{2,}/i := a ]); <- wrong implementation; 
	// 'uniek' added to the list to check proper working. Should use backreferences
	println([ a | a <- eu, /<some:[a-z]>.*<some>/i := a ]);


	// De naam bevat bevat een a: de eerste a die voorkomt wordt vervangen door een o
	// (voorbeeld: "Malta" wordt "Molta")
	println("4.d - Name contains one or more a\'s whose first instance should be replaced by an o:");
	println([ head + "o" + tail | a <- eu, /^<head:[^a]*>a<tail:.*>/i := a ]);
	
}