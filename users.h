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
}
