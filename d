#include<stdio.h>

int main()
{ //priority
    int bt[10],n,et,at[10],pt[10],time,rt[10];
    int i,j,remain,st=0,sm=9;
    float atat=0,awt=0;
    printf("enter the no of processes\n");
    scanf("%d",&n);
    printf("enter the burst and arrival time of each process\n");
    for(i=0; i<n; i++)
        {
            scanf("%d%d",&bt[i],&at[i]);
            rt[i]=bt[i];
        }
    printf("enter priority of each process\n");
    for(i=0; i<n; i++)
        scanf("%d",&pt[i]);
    remain=n;
    pt[9]=100;
    printf("\nprocess_no  burst_time waiting_time  turn_around\n");
    for(time=0; remain!=0; time++)
    {
        sm=9;
        for(i=0; i<n; i++)
        {
            if(at[i]<=time && rt[i]>0 && pt[sm]>pt[i])
            {
             sm=i;
            }
        }
        rt[sm]=rt[sm]-1;
        if(rt[sm]==0)
        {
            et=time+1;
            awt+=et-bt[sm]-at[sm];
            atat+=et-at[sm];
            remain--;
            printf("\n  %d\t %d \t%d \t%d\n",sm,bt[sm],et-at[sm]-bt[sm],et-at[sm]);
        }
    }
    awt=awt/n;
    atat=atat/n;
    printf("\n average waiting time: %f\n average turnaround time: %f",awt,atat);
    return 0;
}
--------
#include<stdio.h>
int main()
{ //rr
  int i,j,n,time,remain,flag=0,ts,temp,pos;
  int sum_wait=0,sum_turnaround=0,at[10],bt[10],rt[10],c[10];
  printf("Enter no of Processes : ");
  scanf("%d",&n);
  remain=n;
  for(i=0;i<n;i++)
  {
    printf("Enter arrival time and burst time for Process P%d :",i+1);
    scanf("%d",&at[i]);
    scanf("%d",&bt[i]);
    rt[i]=bt[i];
    c[i]=i;
  }
  printf("Enter time slice");
  scanf("%d",&ts);
  printf("\n\nProcess\t|Turnaround time|waiting time\n\n");
  for(i=0; i<n; i++)
  {

      pos=i;
      for(j=i+1; j<n; j++)
      {
          if(at[pos]>at[j])
          {
           pos=j;
          }
      }
      temp=at[i];
           at[i]=at[pos];
           at[pos]=temp;
           temp=c[i];
           c[i]=c[pos];
           c[pos]=temp;
           temp=bt[i];
           bt[i]=bt[pos];
           bt[pos]=temp;
           temp=rt[i];
           rt[i]=rt[pos];
           rt[j]=temp;
  }
  for(time=0,i=0;remain!=0;)
  {
    if(rt[i]<=ts && rt[i]>0)
    {
      time+=rt[i];
      rt[i]=0;
      flag=1;
    }
    else if(rt[i]>0)
    {
      rt[i]-=ts;
      time+=ts;
    }
    if(rt[i]==0 && flag==1)
    {
      remain--;
      printf("P[%d]\t|\t%d\t|\t%d\n",c[i+1],time-at[i],time-at[i]-bt[i]);
      sum_wait+=time-at[i]-bt[i];
      sum_turnaround+=time-at[i];
      flag=0;
    }
    if(i==n-1)
      i=0;
    else if(at[i+1]<=time)
      i++;
    else
      i=0;
  }
  printf("\nAvg sum_wait = %f\n",sum_wait*1.0/n);
  printf("Avg sum_turnaround = %f",sum_turnaround*1.0/n);
  return 0;
}
