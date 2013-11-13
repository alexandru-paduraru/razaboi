#include <stdio.h>
#include <stdlib.h>

#include <iostream>
using namespace std; 

//c=0=I inima rosie, c=1=R romb, c=2=F inima negra, c=3=T trefla
//r=0 popa, r=12 dama, r=11 jalet, r=10,2, r=1 as

void randomize(int proces, int v[100]){
	int aux, i, a, b;
	
	for(i=1; i<=100; i++) {
		a = rand() % 13;
		b = rand() % 13;

		a = (proces-1)*13 + a;
		b = (proces-1)*13 + b;

		aux = v[a];
		v[a] = v[b];
		v[b] = aux;
	}

}

void randomize2(int v[100]){
	int aux, i, a, b;
	
	for(i=1; i<=100; i++) {
		a = rand() % 52;
		b = rand() % 52;

		aux = v[a];
		v[a] = v[b];
		v[b] = aux;
	}

}

int main() {
  int numprocs, rank, i;
  int v[100]; //vectorul cu carti
  //std::string elemente = "[{\"numar\":\"7\",\"culoare\":\"B\"},{}]";
  string abc = "string abc afasfasg";

  
  cout << abc;
}