#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.c"
#include "date.h"

int main(int argc, char *argv[])
{
	struct user* arg = (struct user*) malloc(sizeof(struct user));
	char *username = w();

	get_user(arg, username);

	printf(1, "The current user is %s.\n The user %s last logged in on %d/%d/%d %d:%d:%d", arg->username, arg->username, arg->last_login->month,
										arg->last_login->day, arg->last_login->year, arg->last_login->hour,
										arg->last_login->minute, arg->last_login->second);

	free(arg);
	exit();
}
