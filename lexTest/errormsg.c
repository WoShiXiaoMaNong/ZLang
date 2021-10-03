#include <stdio.h>
#include "errormsg.h"

int EM_tokPos = 1;
void EM_error(char * msg)
{

	printf("char pos: %d. %s",EM_tokPos,msg);

}
