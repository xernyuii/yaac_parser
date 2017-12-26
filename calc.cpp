#include<stdio.h>  
#include<stdlib.h>  
#include<ctype.h>  
#include<iostream>
using namespace std;
char token;  
int exp(void);  
int term(void);  
int factor(void);  
void error(){  
     //printf("Error");  
     fprintf(stderr,"Error\n");  
       
     exit(1);  
}  
void match(char expectedToken){  
     if(token == expectedToken) token = getchar();  
     else error();  
}  
int main(){  
    int result;  
    int n;  
    scanf("%d",&n);  
    getchar();  
    while(n--){  
    token = getchar();  
    //std::cout<<token<<" ";
    result = exp();  
    if(token == ';'){  
         getchar();  
         printf("  = %d\n",result);  
       }  
    else error();  
   }  
   // system("pause");  
      
    return 0;  
}  
int exp(){  
    int temp = term();  
    while(token == '+' || token == '-')  {  
                switch(token){  
                   case '+':match('+');  
                            temp += term();
                            cout<<" + ";  
                            break;  
                   case '-':match('-');  
                            temp -=term();  
                            cout<<" - "; 
                            break;  
                }  
    }
    return temp;  
}  
int term(){  
    int temp = factor();  
    while(token == '*' || token == '/'){  
       switch(token){  
         case '*':match('*');  
                  temp *= factor();
                  cout<<" * ";   
                  break;  
         case '/':match('/');  
                  temp /= factor();
                  cout<<" / ";   
                  break;  
         }  
    }
    return temp;  
}  
int factor(){  
    int temp=0;  
       if(isdigit(token)||token=='-'){  
         if (token!='-') ungetc(token,stdin);  
         scanf("%d",&temp); 
         cout<<temp<<" "; 
         token = getchar();  
       }  
       else if(token == '('){  
            match('(');
            cout<<"( ";
            temp = exp();  
            match(')');
            cout<<") ";
       }
       else error(); 
    return temp;  
}  