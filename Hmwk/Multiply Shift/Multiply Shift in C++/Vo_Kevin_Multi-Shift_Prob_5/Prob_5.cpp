/* 
 * File:   Prob_5.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Multiply-Shift Problem# 5
 * Created on September 23, 2015, 8:42 AM
 */

#include <iostream>
#include <cstdlib>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    const float pi = 3.14159f;
    const float radius = 6.5;
    int area;//stores area

    area = static_cast<int>(radius*radius*pi);//sets area

    //Displays given and calculated data
    cout<<"Given: radius = 6.5, Find: area\n";
    cout<<"Area = "<<area<<endl;
    return 0;
}

