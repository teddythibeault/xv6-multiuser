#include "types.h"
#include "stat.h"
#include "user.h"
#include "users.h"

int main(int argc, char *argv[])
{
	if(argc < 2){
		printf(2, "Usage: passwd <password>");
		exit();
	}	

	if(passwd(argv[1]) < 0){
		printf(2, "passwd: failed to change password");
		break;
	} else{
		printf(2, "Successfully changed password");
	
	exit();
}
