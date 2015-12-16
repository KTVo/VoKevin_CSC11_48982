/* 
 * File:   LastMission.h
 * Author: Kevin Vo
 * Class: CSC-11 (48982)
 * Assignment: Project 2
 * Created on December 15, 2015, 8:52 AM
 */

#ifndef LASTMISSION_H
#define	LASTMISSION_H

using namespace std;

int LastMission(){
    float euler = 2.7181281;
    float r = 1.318309;
    float one = 1.00000;
    float pi = 3.14159;
    float st = 2.6879;
    float R1;
    const int ELE = 3;
    float globArr[ELE];
    
    //Load float values into single precision registers
    R1 = st;
    float S9 = R1;
    
    R1 = euler;
    float S10 = R1;
    
    R1 = r;
    float S11 = R1;
    
    R1 = one;
    float S12 = R1;
    
    R1 = pi;
    float S13 = R1;
   
    //Calculates the float numbers to be memorized
    S10 = S10 + S11;
    S10 = S10 + S12;
    
    S10 = S10 * S10;
    S10 = S10 - S13;
    
    S10 = S10 * S9*-1;
    
    globArr[0] = S10; //Stores S10 into the array for later output

    float S8 = S12 - S11;
    
    globArr[1] = S8; //Stores S8 into the array

    S8 = S10 / S8;
    S8 = abs(S10);
    S13 = S13 + S12;
    S8 = S8 / S13;
    
    globArr[2] = S8; //Stores new value of S8 into the array

    int R10 = 0; //Rounds Counter
prompt:
    cout<<"After defeating the beast you have realized that its porous skin "
        <<"released a compound that is toxic to you. However it seems that you "
        <<"have found a box belonging to a nearby corpse labeled antidote."
        <<"Before your last dying breathe solve the puzzle by guessing the "
        <<"matching sets to obtain the antidote.\nYou have 3 turns to do so.\n";

forloopRound:
    if(R10 >= 3) goto lose; //Ends the for loop if inc GTE 3
        
    R10 = R10 + 1; //inc++
    
    cout<<"                "<<R10<<"/3 Rounds\n";

    int input1; //Holds value of the first input
disChart:
    //Displays a visual container for player to see
    cout<<"-------------------\n";
    cout<<"|     |     |     |\n";
    cout<<"|  1  |  2  |  3  |\n";
    cout<<"|     |     |     |\n";
    cout<<"|-----------------|\n";
    cout<<"|     |     |     |\n";
    cout<<"|  4  |  5  |  6  |\n";
    cout<<"|     |     |     |\n";
    cout<<"-------------------\n";

//Requests input for first row and then checks    
ask1:
    cout<<"Enter your first guess (Valid Inputs = 1,2,3): ";
    cin>>input1;
    

    //Checks input1 and display the hidden float value to player
    if(input1 == 1){
        cout<<"Your first input = "<<globArr[2]<<endl;
    }else if(input1 == 2){
        cout<<"Your first input = "<<globArr[0]<<endl;
    }else if(input1 == 3){
        cout<<"Your first input = "<<globArr[1]<<endl;
    }else{}
    
    //checks for invalid inputs
    if(input1<1 || input1>3){ 
        cout<<"\nYour first input is out of range.\n\n";
        goto ask1;
    }
    
    
ask2:
    int input2;//Stores value of the second input
    cout<<"Enter your second guess (Valid Input = 4,5,6): ";
    cin>>input2;
    
    //Checks input2 to display value
    if(input2 == 4){
        cout<<"Your first input = "<<globArr[1]<<endl;
    }else if(input2 == 5){
        cout<<"Your first input = "<<globArr[2]<<endl;
    }else if(input2 == 6){
        cout<<"Your first input = "<<globArr[0]<<endl;
    }else{}
    
    //Checks for out of bound values for input2
    if(input2<4 || input2>6){ 
        cout<<"\nYour second input is out of range.\n\n";
        goto ask2;
    }

//Checks input1 so that it can goto valid 3
checkCorrect:
    if(input1 == 1){
        goto checkSet1;
    }else if(input1 == 2){
        goto checkSet2;
    }else if(input1 == 3){
        goto checkSet3;
    }
    

//Checks 2nd input and indicates if player has chosen correctly
checkSet1:
    if(input2 == 5){
        goto win;
    }else if(input2 != 5){
        goto forloopRound;
    }
checkSet2:
    if(input2 == 6){
        goto win;
    }else if (input2 != 6){
        goto forloopRound;
    }
checkSet3:
    if(input2 == 4){
        goto win;
    
    }else if(input2 != 4){
        goto forloopRound;
    }
    if(R10<3) goto forloopRound;

    
win:
    //Display the winning message then exits
    cout<<"\n*** Congratulations, you have opened the box and drank the "
        <<"antidote. You have survived and won! ***\n";
    goto out;

lose:
    //Displays losing message
    cout<<"\nSorry, you have not guessed a matching set in time. Gameover.\n";

out: //Exits this function  

return 0;}

#endif	/* LASTMISSION_H */

