/* 
 * File:   Prob_2.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Multiply-Shift Problem# 2
 * Created on September 22, 2015, 8:34 PM
 */

#include <iostream>
#include <cstdlib>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    const float pi = 3.14159f;//const pi
    char area = 110;//value of area
    int radiusSq;//Stores magnitude of radius

    radiusSq = static_cast<int>(area)/pi;//Sets radius

    cout<<"Radius^2 = "<<radiusSq<<endl;//Display radius
    return 0;
}

