//< +--------------------------------------------------------------------------------------------------+ >
//| Project: xv6-multiuser
//| File: users.h
//| Description: Header for struct user and user management functions
//| Authors: Luke Ruter, Teddy Thibeault
//| Date: 10 May 2021
//< +--------------------------------------------------------------------------------------------------+ >

struct user
{
	char username[16];
	char password[16];
	char home[32];

	struct rtcdate *last_login;
};

/*char *w();
int login(char username[]);
int get_user(struct user *to_get, char username[]);
int save_user(struct user *to_save);
int attempt_login(char username[], char password[]);
int su(char username[]);
int useradd(char username[]);
int passwd();*/
