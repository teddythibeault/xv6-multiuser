#include "types.h"
#include "user.h"
#include "users.h"


int main(int argc, int argv[]){
	
	int i;
	
	if(argc < 2){
		printf(2, "Usage: addUser <username>");
		exit();
	}

	if(addUser(argv[1]) < 0){
		printf(2, "addUser: %s failed to create\n", argv[
	}

}
