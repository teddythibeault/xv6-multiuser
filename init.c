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
		
			for(;;){
				printf(1, "Username:\t");
				scanf("%s", &username);
				
				printf(1, "Password:\t");
				scanf("%s", &password);
			
				if(username_exists(username)){
					if(passwords_match(password, get_user_from_username(username)->password)){
						exec("sh", &username); //execute shell with username as identifier for directory
						printf(1, "init: exec sh failed\n");
						exit();
					} else{
						printf(1, "Incorrect password. Please try logging in again\n");
					}
				} else{
					printf(1, "No such user exists. Please try again\n");
				}
			}
			
			printf(1, "init: exec sh failed\n");
			exit();

		}

		while((wpid=wait()) >= 0 && wpid != pid) printf(1, "zombie!\n");
	}
}
