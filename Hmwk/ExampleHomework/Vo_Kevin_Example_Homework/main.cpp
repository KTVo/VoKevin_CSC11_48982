/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Example Homework in C++
 * Created on December 10, 2015, 12:27 AM
 */

#include <stdio.h>
#include <cstdlib>

using namespace std;

void fah(int, int);
void cel(int, int);
int main(int argc, char** argv) {
    int start, end, fahCel;
    
    do{
        printf("\nEnter the START then END for the range of temperature.\n");
        scanf("%d %d", &start, &end);
        
        printf("Enter 1 for CENTIGRADE to FAHRENHEIT");
        printf("\nEnter 2 for FAHRENHEIT to CENTIGRADE\n");
        scanf("%d", &fahCel);
    
        if(fahCel == 1) fah(start, end);
        if(fahCel == 2) cel(start, end);
        
    }while(fahCel>0 && fahCel<3);
    return 0;
}

void fah(int start, int end){
    int R1 = start;
    int R2 = end;
    printf("\nCENTIGRADE -> FAHRENHEIT\n");
    printf("----------    ----------\n");
    
    int i = start;
    forloop_CF:{
        int fah = 5/9*(i-32);      
        
        printf("    %d              %d\n", i, fah);
        i++;
    
        if(i <= end){ goto forloop_CF;}
    }
}

void cel(int start, int end){
    int R1 = start;
    int R2 = end;
    
    printf("\nCENTIGRADE -> FAHRENHEIT\n");
    printf("----------    ----------\n");
    
    int i = start;
    forloop_FC:{
        int cel = 9/5*(i+32);
        
        printf("    %d              %d\n", i, cel);
        i++;
    
        if(i <= end){ goto forloop_FC;}
    }
}    