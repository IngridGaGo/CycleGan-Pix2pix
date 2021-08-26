#!/usr/bin/env bash

LOG_DIR="./logs/ssl_exp"
EXPERIMENT="moco_patch_a"

mkdir -p ${LOG_DIR}

python train_MoCo_patch.py \
  --exp-name=${EXPERIMENT} \
  --world-size=1 \
  --rank=0 \
  --dist-url='tcp://localhost:10001' \
  --dist-backend='nccl' \
  --npgus-per-node=4 \
  --workers-patch=20 \
  --epochs=10 \
  --start-epoch=0 \
  --resume='' \
  --print-freq=10 \
  --seed=0 \
  --num-patch=581 \
  --batch-size=128 \
  --lr=0.01 \
  --rep-dim-patch=512 \
  --moco-dim-patch=128 \
  --moco-k-patch=4096 \
  --moco-m-patch=0.999 \
  --moco-t-patch=0.2 \
  --augmentation='a' >> ${LOG_DIR}/${EXPERIMENT}.log 2>&1