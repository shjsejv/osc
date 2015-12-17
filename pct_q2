#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

void err_sys(const char* x)
{
    perror(x);
    exit(1);
}


int main()
{
        pid_t childPid;
        printf("Parent greeting\n");
        childPid =fork();
        if (childPid  >=0)
        {
                if(childPid == 0)
                {
                        printf("Child process\n");
                        sleep(20);
                        printf("child exiting\n");
                   }
                else
                {
                     waitpid(-1,NULL,0);
                }

        }
        else
            {
                     err_sys("fork error\n");
            }
        printf("END\n");
        return 0;
}
