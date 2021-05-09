#include "date.h"

struct user
{
	char username[16];
	char password[16];
	char home[32];
//	char department[50];
//	char fullName[100];
//	char phoneNumber[20];

	struct rtcdate last_login;
};

struct user *get_user_from_username(char username[]);

int username_exists(char username[]);

int passwords_match(struct user* arg, char password[]);

char* get_active_user();
