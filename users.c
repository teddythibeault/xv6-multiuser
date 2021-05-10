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

int save_user(struct user *to_save)
{
	mkdir("/etc/");
	mkdir("/etc/users/");
	char path[50];
	strcpy(path, "/etc/users/");
	strcat(path, to_save -> username);

	int file = open(path, O_CREATE | O_RDWR);
	if (file < 0)
	{
		printf(1, "Failed to open file : save_user.");
		return -1;
	}
	int len = sizeof(*to_save);
	int written = write(file, to_save, len);
	if(written != len)
	{
		printf(1, "Failed to write file : save_user");
		return -1;
	}
	close(file);
	return 0;
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

	struct user *to_update;
	get_user(to_update, username);
	date(to_update -> last_login);
	save_user(to_update);

	printf(1, "Welcome!\n");
	close(file);
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

int su(char username[])
{
	char password[16];
	printf("password: ");
	gets(16, password);
	attempt_login(username, password);
	return 0;
}

int useradd(char username[])
{
	char home[32];
	strcpy(home, "/home/")
	strcat(home, username);
	struct user to_add;
	strcpy(to_add -> username, username);
	strcpy(to_add -> home, home);
	save_user(&to_add);
	return 0;
}

int passwd()
{
	char username[16] = w();
	char password[16];
	struct user *to_update;
	get_user(to_update, username);
	printf("new password: ");
	gets(16, password);
	strcpy(to_update -> password, password);
	save_user(to_update);
	printf("\nupdated.");
	return 0;
}
