#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.c"

int main(int argc, char *argv[])
{
	if(argc < 2)
	{
		printf(2, "Usage: passwd <password>");
		exit();
	}

	if(passwd() < 0)
	{
		printf(2, "passwd: failed to change password");
		exit();
	}

	printf(2, "Successfully changed password");
	exit();
}
