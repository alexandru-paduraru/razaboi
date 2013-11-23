#include<stdio.h>
#include<stdlib.h>
#include<iostream>
#include<mpi.h>
#include<string>
#define MCW MPI_COMM_WORLD

using namespace std;

int main(int argc, char* argv[]){
    
    int numprocs, rank, i;
    int numar[100];
    int culoare[100];
    
    string s = "hello";
    
    MPI_Status status;
    MPI_Init(&argc, &argv);
    
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
   
  
    if(rank == 0){ 
    s = to_string(rank);
    cout<<s;
    }
    else{
    cout<< "hello slave";
    }
    MPI_Finalize();
    cout<<"hello" + s;
    return 1;
}