module FunctiesMetGetallen

import IO;
import Relation;
import Set;

// Part one, step by step
private void tryingToGetDividers() {
	
	// First, calculate all natural numbers
	set[int] numbers = { N | N <- [1..max+1] };
	//println(numbers);
	
	// Next, determine all 'candidate' factors M, N not included
	rel[int, int] numWithAllFac = { <N, M> | N <- [1..max+1], M <- [1..N+1] };
	//println(numWithAllFac);
	
	// Finally, filter out all combinations who lead to not-natural numbers
	// Only, relation M|N
	rel[int, int] numWithFac = { <N, M> | N <- [1..max+1], M <- [1..N+1], N % M == 0 };
	//rel[int, int] numWithFac = { <N, M> | N % M == 0, N <- [1..max+1], M <- [1..N] };
	// Filtering in front is not possible. So, the variables have not been declared yet I guess.
	// SO, { <some> | a, b, a <- [some], b <- [other],  }
	//                              ^--- none    ^--- only a in reach, 
}
	
// Part Two, the clean way
private rel[int, int] getDividers(list[int] numbers) =

	 { <N, M> | N <- numbers, M <- [1..N+1], N % M == 0 };
	

public void relatieMetDelers(int max) {

	rel[int, int] numWithFac = numWithFac( [1..maxNum+1] );
	
	println(numWithFac);
}

public void meesteDelers(int maxNum) {

	// looking for a grouping solution, seems not to be available..
	rel[int, int] numWithFac = getDividers( [1..maxNum+1] );
	
	// use the 'subscription' feature to access the parts as values	
	// we don't want the list itself, only the number of occurrences
	set[int] dom = domain(numWithFac);
	map[int, int] numAndOccs = (s: size(numWithFac[s]) | s <- dom);
	
	// to determine the integer with the most divisers
	int mx = max(range(numAndOccs));
	
	// now, just select the values, filtering by divisers
	set[int] intsWithMostDiv = { n | n <- dom, numAndOccs[n] == mx };
	
	println("The integers <intsWithMostDiv> have all <mx> dividers");
}

// O(n log n)
public void getPrimes(int n) {
	
	list[int] noPrimes = [ p | p <- [ 2..n+1 ], i <- [ 2..p ], p % i == 0 ];
	
	list[int] primes = [ 2..n+1 ] - noPrimes;
	
	println(primes);
}