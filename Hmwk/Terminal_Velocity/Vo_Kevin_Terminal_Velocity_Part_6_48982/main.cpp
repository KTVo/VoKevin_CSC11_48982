/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Terminal Velocity (Part 6) - Using Floats in C++
 * Created on December 9, 2015, 3:54 PM
 */

#include <iostream>
#include <cstdlib>
#include <cmath>
using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    //w = 8 * 0.10125
    float pi = 3.14159, w = 0.81, drag = 0.5, e = 0.0023679, dSQ = 0.0196;
    
    float R1 = pi;
    float S14 = R1;
    
    R1 = e;
    float S15 = R1;
    
    float S2 = S14 * S15; 

    R1 = dSQ;
    S15 = R1;
    
    S2 = S2 * S15;
    
    R1 = drag;
    S15 = R1;
    
    S2 = S2 * S15;
    
    R1 = w;
    S15 = R1;
    
    S2 = S15 / S2;
    
    R1 = e;
    S14 = R1;
    
    S14 = S2 * S14;
    
    R1 = drag;
    float S13 = R1;
    S14 = S13 * S14;
    
    double D0 = S14; //CVTV.F64.F32 
    
    //Calculates V = sqrt(S2)
    S14 = sqrt(S2);
    
    double D1 = S14; //CVTV.F64.F32
    
    cout<<"\nTerminal Velocity (Part 6) - Using Floats in C++\n";
    cout<<"-------------------------------------------------------\n";      
    cout<<"Dynamic Pressure = "<<D0<<"\nTerminal Velocity = "<<D1<<endl;
    return 0;
}

