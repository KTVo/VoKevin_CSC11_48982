/*
 * File:   Boss.h
 * Author: Kevin Vo
 *
 * Created on November 7, 2015, 8:31 PM
 */

#ifndef BOSS_H
#define	BOSS_H
#include <stdio.h>
#include <iostream>
using namespace std;

void Boss(int bossTurn, int pDamage){
    int bossHealth = 100;
    char bossInput;
    char checkA = 'a';

    printf("\nWarning: You must enter 'a' to attack. If you entered in ");
    printf("something else, it will count as a miss and no damage will be ");
    printf("be done.\n");
    int t = 1;
    printf("\nt1 = %d\n", bossTurn);

      while(t <= bossTurn && (bossHealth > 0 && t <= bossTurn)){

        cout<<"\nBoss' Health: "<<bossHealth<<" "<<t<<"/"<<bossTurn<<endl;
        cout<<"\n\nEnter 'a' to attack: ";
        cin>>bossInput;
        t++;
        if(bossInput == checkA){
            bossHealth -= pDamage;
        }else if(bossInput != checkA){
            printf("You missed! No damage has been done.\n");
        }

    }

    endGame:{
    if(bossHealth <= 0){
        printf("\nCongratulations, you've killed the boss and won the game.\n");
    }else if(bossHealth > 0){
        printf("\nYou've not killed the boss in time. He has awaken and ");
        printf("killed you.\n");
    }
    }

}


#endif	/* BOSS_H */

