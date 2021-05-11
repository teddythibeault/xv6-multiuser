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

int get_user(struct user *to_get, char *username)
{
	char path[50];
	char path2[50];
	strcpy(path, "/users/");
	strcat(path, username);
	strcpy(path2, path);
	strcat(path2, "_lastlogin");

	int file = open(path2, O_RDONLY);
	struct rtcdate *last_login = (struct rtcdate*) malloc(sizeof(struct rtcdate));

	if(file < 0)
	{
		printf(1, "failed to get user");
		return -1;
	}

	int len = sizeof(*last_login);
	if(read(file, last_login, len) != len)
	{
		printf(1, "failed to get user\n");
		return -1;
	}

	file = open(path, O_RDONLY);
	if(file < 0)
	{
		printf(1, "failed to get user");
		return -1;
	}

	len = sizeof(*to_get);
	if(read(file, to_get, len) != len)
	{
		printf(1, "failed to get user\n");
		return -1;
	}

	to_get -> last_login = last_login;

	return 0;
}

int save_user(struct user *to_save)
{
	char path[50];
	char path2[50];
	strcpy(path, "/users/");
	strcat(path, to_save -> username);
	strcpy(path2, path);
	strcat(path2, "_lastlogin");

	int file = open(path2, O_CREATE | O_RDWR);
	if (file < 0)
	{
		printf(1, "Failed to open file : save_user.");
		return -1;
	}
	int len = sizeof(*(to_save -> last_login));
	int written = write(file, to_save -> last_login, len);
	if(written != len)
	{
		printf(1, "Failed to write file : save_user");
		return -1;
	}
	close(file);

	file = open(path, O_CREATE | O_RDWR);
	if (file < 0)
	{
		printf(1, "Failed to open file : save_user.");
		return -1;
	}
	len = sizeof(*to_save);
	written = write(file, to_save, len);
	if(written != len)
	{
		printf(1, "Failed to write file : save_user");
		return -1;
	}
	close(file);

	return 0;
}

int login(char *username)
{
	int file = open("/utmp", O_CREATE | O_RDWR);
	int len = 16;


	if(write(file, username, len) != len)
	{
		printf(1, "login failed\n");
		return -1;
	}

	struct user *to_update = (struct user*) malloc(sizeof(struct user));
	get_user(to_update, username);
	to_update -> last_login = (struct rtcdate*) malloc(sizeof(struct rtcdate));
	date(to_update -> last_login);
	save_user(to_update);
	free(to_update -> last_login);
	free(to_update);

/*	char dir[100];
	strcpy(dir, "/home/");
	strcat(dir, username);
	chdir(dir);*/

	printf(1, "Welcome!\n");
	free(username);
	close(file);

	return 0;
}

int attempt_login(char *username, char password[])
{
	struct user to_attempt;

	int found_user = get_user(&to_attempt, username);
	if(found_user < 0)
	{
		printf(1, "username not found : attempt_login : users.c\n");
		return -1;
	}

	if(strcmp(to_attempt.password, password) == 0)
	{
		int result = login(username);

		if(result < 0)
		{
			printf(1, "unable to login : attempt_login : login : users.c");
			return -1;
		}

		return 0;
	}
	else
	{
		printf(1, "incorrect password\n");
		return -1;
	}
}

int w(char *username)
{
	int file = open("/utmp", O_RDONLY);
	if(file < 0)
	{
		printf(1, "error opening utmp\n");
		return -1;
	}

	int len = 16;
	int stat = read(file, username, len);
	if(stat != len)
	{
		printf(1, "error reading utmp\n");
		return -1;
	}
	close(file);

	return 0;
}

int su(char username[])
{
	char *password = malloc(16);
	printf(1, "password: ");
	gets(password, 16);

	char last = username[strlen(username) - 1];
	if (last == '\n' || last == '\r')
		username[strlen(username) - 1] = '\0';

	last = password[strlen(password) - 1];
	if (last == '\n' || last == '\r')
		password[strlen(password) - 1] = '\0';

	int result = attempt_login(username, password);

	if(result < 0)
	{
		printf(1, "unable to login : su : users.c.");
		free(password);
		return -1;
	}

	free(password);
	return 0;
}

int useradd(char username[])
{
	char last = username[strlen(username) - 1];
	if (last == '\n' || last == '\r')
		username[strlen(username) - 1] = '\0';

	char home[32];
	strcpy(home, "/home/");
	strcat(home, username);
	struct user to_add;
	strcpy(to_add.username, username);
	strcpy(to_add.home, home);
	save_user(&to_add);
	return 0;
}

int passwd()
{
	char *username = malloc(16 * sizeof(char));
	w(username);
	char *password = (char *) malloc(16 * sizeof(char));
	struct user *to_update = (struct user*) malloc(sizeof(struct user));
	get_user(to_update, username);

	printf(1, "new password: ");
	gets(password, 16);

	char last = password[strlen(password) - 1];
	if (last == '\n' || last == '\r')
		password[strlen(password) - 1] = '\0';

	strcpy(to_update -> password, password);
	save_user(to_update);

	free(username);
	free(password);
	return 0;
}
