//< +--------------------------------------------------------------------------------------------------+ >
//| Project: xv6-multiuser
//| File: useradd.c
//| Description: user-level function to add another user
//| Authors: Luke Ruter, Teddy Thibeault
//| Date: 10 May 2021
//< +--------------------------------------------------------------------------------------------------+ >

#include "types.h"
#include "user.h"
#include "users.h"

int main(int argc, int argv[])
{
	if(argc < 2)
	{
		printf(2, "Usage: addUser <username>");
		return -1;
	}

	if(addUser(argv[1]) < 0)
	{
		printf(2, "addUser: failed to add %s\n", argv[1]);
		return -1;
	}

	printf(2, "User %s succesfully added\n", argv[1]);
	return 0;
}
