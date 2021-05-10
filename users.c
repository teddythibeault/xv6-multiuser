#include "types.h"
#include "defs.h"
#include "user.h"
#include "date.h"
#include "users.h"

struct user *get_user_from_username(char username[])
{
	struct user *to_return = (struct user *) malloc (sizeof(struct user));
	struct rtcdate *last_login = (struct rtcdate *) malloc (sizeof(struct rtcdate));
	to_return -> last_login = last_login;

	int found = 0;
	while(found == 0)
	{
		FILE *file_pointer;
		file_pointer = fopen("./etc/passwd", "r");
		char buffer[100];
		fgets(buffer, 100, file_pointer);
		sscanf	(buffer, "%s:%s:%s:%d:%d:%d:%d:%d:%d",
					to_return -> username,
					to_return -> password,
					to_return -> home,
					last_login -> second,
					last_login -> minute,
					last_login -> hour,
					last_login -> day,
					last_login -> month,
					last_login -> year
				);

		if(strcmp(to_return -> username, username) == 0)
			found = 1;
	}

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
				mkdir("./etc", 0777);
			}
		}
	}

	struct user *to_check = get_user_from_username(username);
	if(strcmp(to_check -> username, "not found") == 0)
		return 0;
	return 1;
}

int passwords_match(struct user* arg, char password[])
{
	if(strcmp(arg->password, password) == 0){
		return 1;
	} else{
		return 0;
	}
}
