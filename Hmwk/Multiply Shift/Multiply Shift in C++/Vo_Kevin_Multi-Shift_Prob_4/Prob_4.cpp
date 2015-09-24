/* 
 * File:   Prob_4.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Multiply-Shift Problem# 4
 * Created on September 23, 2015, 8:33 AM
 */

#include <iostream>
#include <cstdlib>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    const int radius = 6;//declares radius
    const float pi = 3.14159f;//value of pi
    char area;//stores area

    area = radius*radius*pi;//sets the area

    //Diplays given and calculated values
    cout<<"Given: radius = 6, Find: area\n";
    cout<<"Area = "<<static_cast<int>(area)<<endl;
    return 0;
}

