/* 
 * File:   Prob_3.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Multiply-Shift Problem# 3
 * Created on September 23, 2015, 8:25 AM
 */

#include <iostream>
#include <cstdlib>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    const float pi = 1/3.14159f;//Sets inverse of PI
    int radiusSq;//Stores radius^2
    const float area = 113.4f;//sets given area

    radiusSq = area*pi;//Calculates radius^2

    cout<<"Radius^2 = "<<radiusSq<<endl; //Displays calculated value
    return 0;
}

