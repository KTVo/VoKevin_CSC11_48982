/* 
 * File:   F2C.h
 * Author: Kevin
 * Class: CSC-11 (48982)
 * Assignment: Example Homework in C++
 * Created on December 11, 2015, 9:39 PM
 */

#ifndef F2C_H
#define	F2C_H
using namespace std;

//Converts Fah to Cel
void fahtocel(int start, int end){
    printf("\nFAHRENHEIT -> CENTIGRADE\n");
    printf("----------    ----------\n");
    
    int i = start;
    forloop_CF:{
        int cel = 5.0/9.0*(i-32);      
        
        printf("    %d              %d\n", i, cel);
        i++;
    
        if(i <= end){ goto forloop_CF;}
    }
}


#endif	/* F2C_H */

