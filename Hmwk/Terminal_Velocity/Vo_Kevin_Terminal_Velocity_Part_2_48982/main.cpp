/* 
 * File:   main.cpp
 * Author: Kevin
 *
 * Created on December 1, 2015, 3:54 PM
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
    
    cout<<"***** Terminal Velocity (PART 2) Simple C++\n";
    cout<<"Terminal Velocity = "<<x<<endl;
    cout<<"Dynamic Pressure = "<<q<<endl;
    return 0;
}

