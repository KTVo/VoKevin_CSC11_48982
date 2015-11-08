/* 
 * File:   main.cpp
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Project 1
 * Created on November 7, 2015, 6:51 PM
 */

#include <stdio.h>
#include <cstdlib>
#include <ctime>
#include "Pattern.h"
#include "Guess.h"
#include "Boss.h"

using namespace std;

int main(int argc, char** argv) {
    int pDamage = 3; //sets player's damage
    int bot = 2;
    int input;
    int bossTurn = 7;//Preset # of boss rounds
    printf("Obj: Solve the challenges to obtain weapons and kill the beast.\n");
    
    srand(time(0));
    int rndNum = (rand()%14)+2;


    printf("\n*******************\n");
    printf("*------[ o ]------*\n");
    printf("*                 *\n");
    printf("*     %d MOD %d =?  *\n", rndNum, bot);
    printf("*******************\n");
    scanf("%d", &input);

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

    Challenge2:
        pDamage = Pattern(input, pDamage);

    askGuessBonus:
        char checkA = 'a', inChooseBonus;
        
        printf("\nEnter 'a' if you'd like to do the Bonus round. ");
        printf("If you win, you'll get a total of 10 TURNS to kill the ");
        printf("monster instead of just 7.\n");
        printf("User Input: ");
        scanf("%s", &inChooseBonus);

        if(inChooseBonus == checkA){
            int gBonusRndNum = (rand()%23) + 1;
            bossTurn = guessBonus(gBonusRndNum, bossTurn);
        }else if(inChooseBonus != checkA){
            
        }
        Boss(bossTurn, pDamage);
    return 0;
}

