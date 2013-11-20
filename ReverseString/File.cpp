//
//  File.cpp
//  ReverseString
//
//  Created by Jana on 08/11/2013.
//  Copyright (c) 2013 jana. All rights reserved.
//

#include "File.h"
#include <algorithm>
#include <iostream.h>
#include <stdio.h>

//one way 
//Best if a solution is pass by pointers-Recursive function to reverse an array
void reverse( char* first, char* last )
{
    if( first < last )
    {
        std::swap( *first, *last ) ;
        reverse( first+1, last-1 ) ;
    }
}
int main()
{
    char cstr[] = "Software Emageing!" ;
    //Note that the beauty of std::reverse is that it works with char * strings and std::wstrings just as well as std::strings
    reverse( cstr, cstr + sizeof(cstr) - 2 ) ;
}


// secound way of doing
int reverseString( )
{
    char str[80];
    cout<<"Software Emageing";
    gets(str);
    for(int l=0; str[l]!='\0';l++);  //Loop to find length
    cout<<"The length of the string is : "<<l<<endl ;
    for(int i=l-1;i>=0;i--)    //Loop to display the string backwards
        cout<<str[i];
    return 0; 
}


// third way of doing
void Reverse()
{       // Reverse the string contained in theWord.
    char theWord="Software Emageing";
    int i;
    char temp;
    
    for (i=0; i<theWord.length()/2; i++)
    {
        temp = theWord[i];
        theWord[i] = theWord[theWord.length()-i-1];
        theWord[theWord.length()-i-1] = temp;
    }
}

