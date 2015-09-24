/* 
 * File:   Prob_1.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Multiply-Shift Problem# 1
 * Created on September 22, 2015, 7:13 PM
 */

#include <iostream>
#include <cstdlib>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    unsigned char month = 88; //Sets number of months
    const float m2Y = 1.0f/12.0f;//Use to convert months to years

    cout<<static_cast<int>(month*m2Y)<<endl;//Calculate & displays months to yrs
    
    return 0;
}

