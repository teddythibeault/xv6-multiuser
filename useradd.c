
#include "types.h"
#include "user.h"
#include "users.h"


int main(int argc, int argv[]){
	
	if(argc < 2){
		printf(2, "Usage: addUser <username>");
		exit();
	}

	if(addUser(argv[1]) < 0){
		printf(2, "addUser: failed to add %s\n", argv[1]);
		break;
	} else{
		printf(2, "User %s succesfully added\n", argv[1]);
	}

	exit();

}
