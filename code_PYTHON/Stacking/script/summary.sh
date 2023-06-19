for s in $(ls)  #所有在当前目录的文件
do ([ -d $s ] && cd $s; E=`awk '/F=/ {print $0}' OSZICAR` ; echo $s $E  >>../SUMMARY.fcc)  #小括号意思执行完文件回到当前文件夹，-d判断s是不是文件夹
done
