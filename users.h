#include "date.h"



struct user
{
	char username[16];
	char password[16];
//	char department[50];
//	char fullName[100];
//	char phoneNumber[20];

	struct rtcdate last_login;
}


struct user* get_user_from_line(FILE* file_pointer);

struct user get_user_from_username(char username[]);

int username_exists(char username[]);

int passwords_match(char password[]);

char* get_active_user();
