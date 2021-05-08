#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.h"
#include<stdlib.h>
#include "date.h"

int main(int argc, char *argv[])
{
	struct user* newUser = (struct user*) malloc(sizeof(struct user));
	
	
	printf("Creating new user.\nEnter username (max 16 characters):\t");
	scanf("%s", &(newUser->username));
		
	printf("\nEnter password (max 16 characters):\t");
	scanf("%s", &(newUser->password));

/*	printf("\nEnter full name (max 100 characters):\t");
	scanf("%s", &(newUser->fullName));

	printf("\nEnter department (max 50 characters):\t");
	scanf("%s", &(newUser->department));

	printf("\nEnter phone number (max 20 characters):\t");
	scanf("%s", &(newUser->phoneNumber));
*/
	date(&(newUser->last_login));	
}
