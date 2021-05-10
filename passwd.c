#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.c"

int main(int argc, char *argv[])
{
	if(argc < 2)
	{
		printf(2, "Usage: passwd <password>");
		return -1;
	}

	if(passwd() < 0)
	{
		printf(2, "passwd: failed to change password");
		return -1;
	}

	printf(2, "Successfully changed password");
	return 0;
}
