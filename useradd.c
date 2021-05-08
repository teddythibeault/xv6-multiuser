#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.h"
#include<stdlib.h>

int main(int argc, char *argv[])
{
	struct user* newUser = malloc(sizeof(struct user));
	
	
	printf("Creating new user.\nEnter username\t");
	scanf("%s", &(newUser->username));
		
	printf("\nEnter password:\t");
	scanf("%s", &(newUser->password));

	printf("\nEnter full name:\t");
	scanf("%s", &(newUser->fullName));

	printf("\nEnter department:\t");
	scanf("%s", &(newUser->department));

	printf("\nEnter phone number:\t");
	scanf("%s", &(newUser->phoneNumber));

	
}
