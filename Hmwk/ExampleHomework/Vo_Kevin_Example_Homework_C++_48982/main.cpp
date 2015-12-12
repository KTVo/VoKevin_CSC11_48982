/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Example Homework in C++
 * Created on December 10, 2015, 12:27 AM
 */

#include <stdio.h>
#include <cstdlib>
#include "C2F.h"
#include "F2C.h"

using namespace std;


int main(int argc, char** argv) {
    int start, end, fahCel;
    
    do{
        printf("\nEnter the START then END for the range of temperature.\n");
        scanf("%d %d", &start, &end);
        
        printf("Enter 1 for CENTIGRADE to FAHRENHEIT");
        printf("\nEnter 2 for FAHRENHEIT to CENTIGRADE\n");
        printf("Enter any other # to exit.\n");
        scanf("%d", &fahCel);
    
        if(fahCel == 1) fahtocel(start, end); //C -> F
        if(fahCel == 2) celtofah(start, end); //F -> C
        
    }while(fahCel>0 && fahCel<3);
    return 0;
}

