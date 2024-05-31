#!/bin/bash
set -uxo pipefail	 

#SBATCH --job-name=testsbatch         # Job name
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=YOURMAIL    # Where to send mail  
#SBATCH --nodes=1                     # 申请节点数为1 
#SBATCH --ntasks=11                    # 提交任务数 
       #--ntasks-per-node=11           # 每个节点的任务数，--ntasks参数的优先级高于该参数 
       #如果使用--ntasks这个参数那么将会变为每个节点最多运行的任务数
#SBATCH --partition=wggc1             # 指定提交分区
#SBATCH --cpus-per-task=1             # 每个任务所需要的核心数，默认为1；
#SBATCH --mem=1gb                     # 内存申请
#SBATCH --time=02:35:00               # 最长运行时间 hrs:min:sec
#SBATCH --nodelist=wheat4         # 指定优先使用节点
#SBATCH --exclude=wheat[3]            # 指定避免使用节点
#SBATCH --output=~/sixwh_CNV/1Mb/test_CNV.o      # Standard output
#SBATCH --error=~/sixwh_CNV/1Mb/test_CNV.e       # Standard error

sample_data=../onlinelst.txt
#sample_data=/data2/user2/niujx/wheatCNVb/sixwh_100K/02.CNV/sam.tmp
arr=(`awk '{print $1}' ${sample_data}|tr '\n' ' '|sed s/' '$//g`)
path=/data2/user2/niujx/hyc_test/pan_CNV

if true;then
for SAMPLE in ${arr[@]};do
rm $SAMPLE
  sed -z 's/\n//g' ${path}/$SAMPLE/marker_pan_all.index > $SAMPLE
done
fi