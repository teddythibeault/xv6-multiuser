#include "types.h"
#include "user.h"
#include "users.h"
#include "fcntl.h"

int w(void)
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
	if(argptr(0, (void*) &username, sizeof(*username)) < 0) return -1;
	return 0;
}

int login(void)
{
	char username[16];
	if(argstr(16, &username) < 0) return -1;

	int file = open("utmp", O_CREATE | O_RDWR);
	if(file >= 0) printf(1, "login success\n");
	else
	{
		printf(1, "login failed\n");
		return -1;
	}
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

int user(void)
{
	char username[16];
	if(argptr(1, (void*) &username, sizeof(*username)) < 0) return -1;

	struct user *populate;
	if(argptr(0, (void*)&d, sizeof(*d)) < 0) return -1;
	cmostime(d);
	return 0;
}

int attempt_login(void)
{
	char username[16], password[16];

	if(argptr(0, (void*) &username, sizeof(*username)) < 0) return -1;
	if(argptr(1, (void*) &password, sizeof(*password)) < 0) return -1;

	struct user to_attempt = user(username);

	if(strcmp(to_attempt.password, password) == 0)
	{
		login(username);
		return 0;
	}
	else
		return -1;
}

int su(void)
{
	return 0;
}

int useradd(void)
{
	return 0;
}

int passwd(void)
{
	return 0;
}
