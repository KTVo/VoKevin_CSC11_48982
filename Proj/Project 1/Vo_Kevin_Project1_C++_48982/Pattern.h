/* 
 * File:   Pattern.h
 * Author: Kevin Vo
 *
 * Created on November 7, 2015, 7:07 PM
 */

#ifndef PATTERN_H
#define	PATTERN_H
#include <stdio.h>
using namespace std;
int Pattern(int patInput, int pDamage){
    int RightWrong; //Sends back if Challenge 2 is right or wrong
    printf("\n\nFigure out which number goes next to win a weapon.\n");
    printf("\n*******************\n*------[ o ]------*\n*");

    int increment = 0, ansPat;
        for_loop_pat:
            ansPat = increment + 4;
            ansPat *= 4;
            ansPat += 2;        
            increment += 1;
            if(increment == 1) ansPat = 14;
            if(increment <= 4) printf("%d, ", ansPat);
            if(increment < 5) goto for_loop_pat;

    printf("_?_\n");
    printf("*******************\n");
    printf("Input the next value: ");
    scanf("%d", &patInput);
    if(patInput == ansPat){
        printf("\nThe input was correct. You've earned a LUPARA +10 Damage.\n");
        pDamage += 10;
    }
    else if(patInput != ansPat){
        printf("\nSorry, but input should = %d. The prize will NOT be given.\n", ansPat);
    }
return pDamage;}

#endif	/* PATTERN_H */

