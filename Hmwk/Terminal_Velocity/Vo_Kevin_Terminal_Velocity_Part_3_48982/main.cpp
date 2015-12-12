/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Terminal Velocity (Part 3) - Scaled Integer in C++
 * Created on December 6, 2015, 7:59 PM
 */

#include <cstdlib>
#include <iostream>
#include <cmath>

using namespace std;

int main(int argc, char** argv) {
     int pi = 0x3243F6A9; 
     int diaSQ = 0x504816F0; 
     int w = 0x19EB851E;
     int e = 0x9B2EC51;
    int v, q, bot, top;
    
    top = w;
    
    pi>>=16;
    e>>=12;
    bot = pi * e;
    bot>>=16;
    diaSQ>>=16;
    bot = bot * diaSQ;
    bot>>=12;

    v = top/bot;
    
    //Finds Dynamic Pressure
    q = v * e;
    q>>=1;
    q>>=24;
    
    cout<<"***** Terminal Velocity (Part 3) - Scaled Integer C++\n";
    cout<<"Dynamic Pressure = "<<q<<endl;
    cout<<"Terminal Velocity = "<<sqrt(v)<<endl;
    return 0;
}
