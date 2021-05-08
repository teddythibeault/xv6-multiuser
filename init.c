// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "users.h"
#include <unistd.h>
#include <string.h>
#include<stdlib.h>

char *argv[] = { "sh", 0 };

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

	//login
	int successful_login = 0;
	char username[16];
	char password[16];

	while (successful_login != 1)
	{
		printf(1, "login: ");
		scanf("%s", &username);
	}

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
			exec("sh", argv);
			printf(1, "init: exec sh failed\n");
			exit();
		}

		while((wpid=wait()) >= 0 && wpid != pid) printf(1, "zombie!\n");
	}
}
