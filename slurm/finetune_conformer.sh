#!/bin/bash
#SBATCH --job-name=finetune_conformer
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=10
#SBATCH --ntasks=1
#SBATCH --mem=50G
#SBATCH --qos=gpu1day
#SBATCH --gres=gpu:4
#SBATCH --partition=a100
#SBATCH --output=scicore_out/finetune-conformer-%A_%a.out

ml CMake/3.23.1-GCCcore-11.3.0
ml libsndfile/1.1.0-GCCcore-11.3.0
ml FLAC/1.3.4-GCCcore-11.3.0
ml SoX/14.4.2-GCCcore-11.3.0
ml FFmpeg/.5.0.1-GCCcore-11.3.0
ml cuDNN/8.1.0.77-CUDA-11.2.1
ml Python/3.10.4-GCCcore-11.3.0

source venv/bin/activate

export HYDRA_FULL_ERROR=1
export CUDA_VISIBLE_DEVICES=0,1,2,3

srun python train/asr/speech_to_text_ctc_bpe.py
