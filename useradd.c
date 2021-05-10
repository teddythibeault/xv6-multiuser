#include "types.h"
#include "stat.h"
#include "date.h"
#include "user.h"
#include "users.h"

int main(int argc, char *argv[])
{
	struct user* newUser = (struct user*) malloc(sizeof(struct user));


	printf("Creating new user.\nEnter username (max 16 characters):\t");
	scanf("%s", &(newUser->username));

	printf("\nEnter password (max 16 characters):\t");
	scanf("%s", &(newUser->password));

	date(&(newUser->last_login));
}
