#!/bin/bash


set -ex

MOUNT_BASE="/titan"
MOUNTED=false  # 用于记录是否发生挂载行为


# 获取所有块设备的信息
DEVICE_LIST=$(blkid -o device)

# 遍历每个设备，检查 PARTLABEL
for DEVICE in $DEVICE_LIST; do
  PARTLABEL=$(blkid -o value -s PARTLABEL $DEVICE)
  
  if [ "$PARTLABEL" == "cloud" ] || [ "$PARTLABEL" == "space" ]; then
    MOUNT_PATH="$MOUNT_BASE/$PARTLABEL"
    
    # 检查目标挂载路径是否存在，如果不存在则创建
    if [ ! -d "$MOUNT_PATH" ]; then
      mkdir -p "$MOUNT_PATH"
    fi


    if grep -qs "$MOUNT_POINT" /proc/mounts; then
      echo "The mount point $MOUNT_POINT is already mounted."
    else
      # 挂载设备到目标路径
      UUID=$(blkid -o value -s UUID $DEVICE)
      mount -U $UUID $MOUNT_PATH
      echo "mount $MOUNT_POINT successful!"
      MOUNTED=true

    fi
  fi
done


# 根据是否发生挂载行为来决定是否执行 start 脚本
if $MOUNTED; then
  /root/titan/start.sh
fi
