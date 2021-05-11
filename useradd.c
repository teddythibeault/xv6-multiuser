//< +--------------------------------------------------------------------------------------------------+ >
//| Project: xv6-multiuser
//| File: useradd.c
//| Description: user-level function to add another user
//| Authors: Luke Ruter, Teddy Thibeault
//| Date: 10 May 2021
//< +--------------------------------------------------------------------------------------------------+ >

#include "types.h"
#include "users.c"

int main(int argc, char *argv[])
{
	if(argc < 2)
	{
		printf(2, "Usage: addUser <username>");
		exit();
	}

	if(useradd(argv[1]) < 0)
	{
		printf(2, "addUser: failed to add %s\n", argv[1]);
		exit();
	}

	printf(2, "User %s succesfully added\n", argv[1]);
	exit();
}
