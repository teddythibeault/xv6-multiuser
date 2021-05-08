#include "date.h"

struct user *get_active_user()
{
	struct user *to_return = (struct user *) malloc (sizeof(struct user));

	FILE *file_pointer = fopen("./utmp", "r");
	fscanf(file_pointer, "%s:%s", to_return -> username, to_return -> last_login);

	return to_return;
}

struct user get_user_from_username(char username[])
{
	struct user *to_return = (struct user *) malloc (sizeof(struct user));
	struct user *last_login = (struct rtcdate *) malloc (sizeof(struct rtcdate));
	to_return -> username = "";
	to_return -> password = "";
	to_return -> home = "";
	to_return -> last_login = last_login;

	FILE *file_pointer;
	file_pointer = fopen("./etc/passwd", "r");
	char buffer[100];
	fgets(buffer, 100, file_pointer);



	return to_return;
}

int username_exists(char username[])
{
	if(strcmp(username, "root") == 0)
	{
		//https://stackoverflow.com/questions/9314586/c-faster-way-to-check-if-a-directory-exists
		if (0 != access("./etc/", F_OK))
		{
			if (ENOENT == errno)
			{
				char *mkargs[] = {"mkdir", "./etc"};
				exec("mkdir", mkargs);
			}
		}
	}

	struct user *to_check = get_user_from_username(username);
	if(strcmp(to_check -> username, "not found") == 0)
		return 0;
	return 1;
}

int passwords_match(char password[])
{

}
