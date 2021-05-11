//< +--------------------------------------------------------------------------------------------------+ >
//| Project: xv6-multiuser
//| File: su.c
//| Description: user-level function for switch-user
//| Authors: Luke Ruter, Teddy Thibeault
//| Date: 10 May 2021
//< +--------------------------------------------------------------------------------------------------+ >

#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.c"

int main(int argc, char *argv[])
{
	if(argc < 2)
	{
		printf(2, "Usage: su <username>");
		exit();
	}

	if(su(argv[1]) < 0)
	{
		printf(2, "su: failed to change user to %s\n", argv[1]);
		exit();
	}

	exit();
}
