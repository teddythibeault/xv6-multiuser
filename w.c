#include "types.h"
#include "stat.h"
#include "users.c"

int main(int argc, char *argv[])
{
	struct user *arg = (struct user *) malloc(sizeof(struct user));
	char *username = malloc(16 * sizeof(char));
	w(username);

	int status = get_user(arg, username);

	if (status < 0)
	{
		printf(1, "error getting current user\n");
		exit();
	}


	printf(1, "Current User: %s\n", arg -> username);
//	printf(1, "The current user is %s.\n The user %s last logged in on %d/%d/%d %d:%d:%d\n", username,

	/*arg->username, arg->last_login->month,
										arg->last_login->day, arg->last_login->year, arg->last_login->hour,
										arg->last_login->minute, arg->last_login->second);*/

	free(arg);
	free(username);
	exit();
}
