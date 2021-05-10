//< +--------------------------------------------------------------------------------------------------+ >
//| Project: xv6-multiuser
//| File: users.c
//| Description: Provides user-level functions for user management
//| Date: 10 May 2021
//< +--------------------------------------------------------------------------------------------------+ >

#include "types.h"
#include "user.h"
#include "users.h"
#include "fcntl.h"

char[] w()
{
	char username[16];

	int file = sys_open("utmp", O_RDONLY);
	if(file < 0)
	{
		printf(1, "w failed to open file\n");
		exit();
	}

	int len = strlen(username);
	read(file, &username, len);
	close(file);

	return username;
}

int login(char username[])
{
	int file = open("utmp", O_CREATE | O_RDWR);
	int len = strlen(username);

	if(write(file, &username, len) != len)
	{
		printf(1, "login failed\n");
		return -1;
	}

	printf(1, "Welcome!\n");
	close(file);
	return 0;
}

int get_user(struct user *to_get, char username[])
{
	int file = sys_open("utmp", O_RDONLY);

	if(file < 0)
	{
		printf(1, "user was not found\n");
		return -1;
	}

	int len = sizeof(*to_get);
	if(read(file, to_get, len) != len)
	{
		printf(1, "failed to get user\n");
		return -1;
	}

	return 0;
}

int attempt_login(char username[], char password[])
{
	struct user to_attempt;

	int found_user = user(&to_attempt, username);
	if(found_user < 0)
	{
		printf("username not found\n");
		return -1;
	}

	if(strcmp(to_attempt.password, password) == 0)
	{
		login(username);
		return 0;
	}
	else
	{
		printf("incorrect password\n");
		return -1;
	}
}

int su(char username[])
{

}

int useradd(void)
{
	return 0;
}

int passwd(void)
{
	return 0;
}
