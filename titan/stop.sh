#!/bin/bash


set -ex
# tv 204 / cloud 203 / bt  208

stop_cts() {
  # 检查容器是否运行，如果运行则关闭
  for CT_ID in 203 204 208; do
    if pct status $CT_ID | grep -q "running"; then
      pct stop $CT_ID
      echo "Container $CT_ID stopped."
    else
      echo "Container $CT_ID not runing, do nothing."
    fi
  done
}

MOUNT_BASE="/titan"
SPACE_DIR="$MOUNT_BASE/space"
CLOUD_DIR="$MOUNT_BASE/cloud"

# 检查 /titan/space 和 /titan/cloud 是否已经挂载
if grep -qs "$SPACE_DIR" /proc/mounts && grep -qs "$CLOUD_DIR" /proc/mounts; then
    echo "Both $SPACE_DIR and $CLOUD_DIR are already mounted. do nothings."
else
    echo "One or both directories are not mounted."
    stop_cts
fi



