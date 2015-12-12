/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Terminal Velocity (Part 4) - Scaled w/ Babylonian & Divmod in C++
 * Created on December 6, 2015, 7:59 PM
 */
#include <cstdlib>
#include <iostream>

using namespace std;

int divmod(int, int);
int sqrtBabylonian(int);
/*
 * 
 */
int main(int argc, char** argv) {
    int pi = 0x3243F6A9; 
    int diaSQ = 0x504816F0; 
    int w = 0x19EB851E;
    int e = 0x9B2EC51;
    int v, q, bot, top, sqrtV;
    
    top = w;
    
    pi>>=16;
    e>>=12;
    bot = pi * e;
    bot>>=16;
    diaSQ>>=16;
    bot = bot * diaSQ;
    bot>>=12;
    v = divmod(top, bot);
    sqrtV = sqrtBabylonian(v);
    
    //Finds Dynamic Pressure
    q = v * e;
    q>>=25;
   
    
    cout<<"\nTerminal Velocity (PART 4) - Scaled w/ Babylonian & Divmod in C++";
    cout<<"\n---------------------------------------------------------------\n";
    cout<<"w/ Babylonian Method & DivMod *****\n";
    cout<<"Dynamic Pressure with DivMod = "<<q<<endl;
    cout<<"Terminal Velocity with DivMod & Babylonian = "<<sqrtV<<endl;
    return 0;
}

int divmod(int top, int bot){
    int Vdivmod = 0;
    while(top >= bot){
        Vdivmod++;
        top = top - bot;
    }
return Vdivmod;}

int sqrtBabylonian(int VtoSQRT){
    
    //Finds the SQRT Babylonian Method
    int x = VtoSQRT/2;
    cout<<"X = "<<x<<endl;
    int y; //y = x.(n+1)
    
    cout<<"X2 = "<<x<<endl;
    //y = x.(n+1), x = x.n
    
    while(x != y){
        y = x;//Set y = x.(n+1)
        int B = divmod(VtoSQRT, x);
        x = (x + B);
        x>>=1; // multiply by 1/2
    }    

return x;}