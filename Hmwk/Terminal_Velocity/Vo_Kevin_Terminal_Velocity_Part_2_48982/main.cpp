/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Terminal Velocity (Part 2) - Same Calculation in C++
 * Created on December 6, 2015, 7:59 PM
 */
#include <cstdlib>
#include <iostream>
#include <cmath>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    float d = 0.14;
    float w = 0.10125;
    float C = 0.5; // Coefficient of Drag
    float e = 0.0023679; // Air Density
    float v, q; //Terminal Velocity, Dynamic Pressure
    float pi = 3.14159265359;
    float num, denum;
    
    num = 8 * w;
    denum = pi * e;
    d = d * d;
    denum = denum * d;
    denum = denum * C;
    
    v = num/denum;
    
    //Finds the SQRT Babylonian Method
    float x = v, y;
    int count = 0;
    
    //Set x = v/2
    while(x >= 1){
        x = x - 2;
        count++;
    }
    x = count;
    //y = x.(n+1), x = x.n
    
    while(x != y){
        y = x; 
        x = 0.5 * (x + v/x);
    }
    
    v = x;
    q = 0.5 * e * v * v;
    
    cout<<"***** Terminal Velocity (PART 2) Same Calculation in C++\n";
    cout<<"Terminal Velocity = "<<x<<endl;
    cout<<"Dynamic Pressure = "<<q<<endl;
    return 0;
}

