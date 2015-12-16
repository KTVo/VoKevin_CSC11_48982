/* 
 * File:   Guess.h
 * Author: Kevin Vo
 *
 * Created on November 7, 2015, 7:57 PM
 */

#ifndef GUESS_H
#define	GUESS_H
#include <stdio.h>
using namespace std;

int guessBonus(int gBonusRndNum, int bossTurn){
    int inGuessBonus;
    printf("\nObj: Guess a number 0 and 23. The game will let you know if your");
    printf(" INPUT is too HIGH or LOW. You'll get 5 TRIES to get it right.\n");
    
    for(int i = 0; i <= 5; i++){
        
            printf("\nRand = %d\n", gBonusRndNum);
            printf("User Input: ");
            scanf("%d", &inGuessBonus);
        
            if(inGuessBonus > gBonusRndNum){
                printf("The INPUT is too HIGH.\n");
            }else if(inGuessBonus < gBonusRndNum){
                printf("The INPUT is too LOW.\n");
            }else if(inGuessBonus == gBonusRndNum){
                printf("\nYou've guessed correctly!\n You now have 10 TURNS ");
                printf("instead of 7 TURNS to kill the monster.\n");
                bossTurn += 3;//sets #boss turn to 10 if guessBonus won
                goto STOPguess;
            }
        
    }
    STOPguess:{}
return bossTurn;}

#endif	/* GUESS_H */

