/* 
 * File:   C2F.h
 * Author: Kevin
 * Class: CSC-11 (48982)
 * Assignment: Example Homework in C++
 * Created on December 11, 2015, 9:39 PM
 */

#ifndef C2F_H
#define	C2F_H
using namespace std;

//Converts Cel to Fah
void celtofah(int start, int end){
    
    printf("\nCENTIGRADE -> FAHRENHEIT\n");
    printf("----------    ----------\n");
    
    int i = start;
    forloop_FC:{
        int fah = 9.0/5.0*i+32;
        
        printf("    %d              %d\n", i, fah);
        i++;
    
        if(i <= end){ goto forloop_FC;}
    }
}    


#endif	/* C2F_H */

