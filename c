#include<stdio.h>
main()
{  //fcfs
    int n,bt[10],at[10],sm,time,remain,flag[10];
    float awt=0,atat=0;
    int i,j;
    printf("enter the no of processes\n");
    scanf("%d",&n);
    printf("enter bursttime and arrival time of each process\n");
    for(i=0; i<n; i++)
    {
        printf("\nprocess %d: ",i);
        scanf("%d%d",&bt[i],&at[i]);
        flag[i]=0;
    }
    remain=n;
    at[9]=999;
    printf("process waitingtime turnaround\n");
    for(time=0; remain!=0;)
    {
        sm=9;
        for(i=0; i<n; i++)
        {
            if(at[i]<=time && at[sm]>at[i] && flag[i]==0)
            sm=i;
        }
        flag[sm]=1;
        time+=bt[sm];
        awt+=time-at[sm]-bt[sm];
        atat+=time-at[sm];
        printf("%d\t   %d\t  %d\n",sm,time-at[sm]-bt[sm],time-at[sm]);
        remain--;
    }

     awt/=n;
     atat/=n;
     printf("avg waiting time:%f  avg tutnaround time:%f",awt,atat);
       return 0;
}
-------
#include<stdio.h>
main()
{ //sjf
    int n,bt[10],at[10],sm,et,time,remain,flag[10]={0};
    float awt=0,atat=0;
    int i,j,temp;
    printf("enter the no of processes\n");
    scanf("%d",&n);
    printf("enter bursttime and arrival time of each process\n");
    for(i=0; i<n; i++)
    {
        printf("\nprocess %d: ",i);
        scanf("%d%d",&bt[i],&at[i]);
    }
    remain=n;
    bt[9]=1000;
    printf("process waitingtime turnaround\n");
    for(time=0; remain!=0;)
    {
        sm=9;
        for(i=0; i<n; i++)
        {
            if(at[i]<=time && bt[sm]>bt[i] && flag[i]==0)
            sm=i;
        }
        flag[sm]=1;
        time+=bt[sm];
        awt+=time-at[sm]-bt[sm];
        atat+=time-at[sm];
        printf("%d\t   %d\t  %d\n",sm,time-at[sm]-bt[sm],time-at[sm]);
        remain--;
    }

     awt/=n;
     atat/=n;
     printf("avg waiting time:%f  avg tutnaround time:%f",awt,atat);
       return 0;
}
