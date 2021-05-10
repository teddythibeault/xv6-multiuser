//< +--------------------------------------------------------------------------------------------------+ >
//| Project: xv6-multiuser
//| File: init.c
//| Description: The first program in user-space. prompts for login, and starts shell
//| Date: 10 May 2021
//< +--------------------------------------------------------------------------------------------------+ >

#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "users.h"

char *argv[] = { "sh", 0 };
char username[16];
char password[16];

int main(void)
{
	int pid, wpid;

	if(open("console", O_RDWR) < 0)
	{
		mknod("console", 1, 1);
		open("console", O_RDWR);
	}
	dup(0);  // stdout
	dup(0);  // stderr

	for(;;)
	{
		printf(1, "init: starting sh\n");
		pid = fork();

		if(pid < 0)
		{
			printf(1, "init: fork failed\n");
			exit();
		}

		if(pid == 0)
		{

			for(;;)
			{
			/*	int result = -1;
				while(result < 0)
				{
					printf(1, "Username:\t");
					gets(username, 16);

					printf(1, "Password:\t");
					gets(password, 16);

					char *args[] = { "attempt_login", username, password};
					result = exec("attempt_login", args);
				}*/

				exec("sh", argv);
				printf(1, "init: exec sh failed\n");
				exit();
			}

			printf(1, "init: exec sh failed\n");
			exit();
		}

		while((wpid=wait()) >= 0 && wpid != pid) printf(1, "zombie!\n");
	}
}
