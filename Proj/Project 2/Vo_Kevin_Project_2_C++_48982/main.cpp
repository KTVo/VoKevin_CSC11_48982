/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Project 2
 * Created on December 15, 2015, 7:51 AM
 */

//Check list
// Float and array are in LastMission.h

#include <stdio.h>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <cmath>
#include "LastMission.h" //Project 2's code
#include "Pattern.h"
#include "Guess.h"
#include "Boss.h"

using namespace std;

int main(int argc, char** argv) {
    int pDamage = 3; //sets player's damage
    int bot = 2;
    int input;
    int bossTurn = 7;//Preset # of boss rounds
    char inSkip;
    
    //Prompt asking user if they'd want to go ahead and proceed to project 2
    cout<<"Attention: Would you like to skip to Project 2 (y/n)?\n";
    cout<<"User Input: ";
    cin>>inSkip;

    //If player enters yes, it will launch Project 2's code and exit when
    //dynamic activation is done
    if(inSkip == 'y'){
        LastMission();
        return 0;
    }

    printf("Obj: Solve the challenges to obtain weapons and kill the beast.\n");
    //Loads random number into rndNum
    srand(time(0));
    int rndNum = (rand()%14)+2;

    //Display of challege one
    printf("\n*******************\n");
    printf("*------[ o ]------*\n");
    printf("*                 *\n");
    printf("*     %d MOD %d =?  *\n", rndNum, bot);
    printf("*******************\n");
    scanf("%d", &input);

    //Do while loop for calculating the mod of random number
    do_while_loop:
        rndNum = rndNum - 2;
        if(rndNum > 1) goto do_while_loop;

        printf("Mod answer = %d\n", rndNum);
    if(input == rndNum){
        printf("\nGood job! You have won the first challenge. You are now ");
        printf("rewarded a sword. + 3 Damage.\n");
        pDamage += 3;
    }else if(input != rndNum){
        printf("\nYou did not get the first challenge correct. The chest ");
        printf("cannot be open.\n");
    }

    //Loads the second challenge and set it = to pDamage
    Challenge2:
        pDamage = Pattern(input, pDamage);

    //Requests player to accept the challenge to increase their # of turns
    askGuessBonus:
        char checkA = 'a', inChooseBonus;
        
        printf("\nEnter 'a' if you'd like to do the Bonus round. ");
        printf("If you win, you'll get a total of 10 TURNS to kill the ");
        printf("monster instead of just 7.\n");
        printf("User Input: ");
        scanf("%s", &inChooseBonus);

        //If they enter "a" then challenge accepted
        if(inChooseBonus == checkA){
            int gBonusRndNum = (rand()%23) + 1;
            bossTurn = guessBonus(gBonusRndNum, bossTurn);
        }else if(inChooseBonus != checkA){
            
        }

        Boss(bossTurn, pDamage);//Loads Boss mission
        LastMission();//Loads project 2's code which is the puzzle game

    return 0;
}

