#!/usr/bin/env bash
# ==============================================================================
# Script Name  : start.sh
# Description  : أساسيات بناء وتشغيل أول Bash Script وتنفيذ أوامر متسلسلة
#                Demonstrates basic Bash script execution, environment info,
#                and interactive pause before exit.
# Course Ref   : Learn Command Line (Elzero Web School) - Lesson #23
# Author       : Ammar Al-Najjar (https://github.com/Ammar-1993)
# Usage        : bash scripts/start.sh
# ==============================================================================

# ------------------------------------------------------------------------------
# تعريف ألوان الطباعة لتحسين وضوح المخرجات في الـ Terminal
# ANSI color codes for clean, readable terminal output
# ------------------------------------------------------------------------------
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo -e "${CYAN}==================================================${RESET}"
echo -e "${GREEN}   Welcome to Your First Bash Script (Lesson 23)  ${RESET}"
echo -e "${CYAN}==================================================${RESET}"
echo ""

# [1] تنفيذ الأمر الأول: طباعة رسالة ترحيبية
echo -e "${YELLOW}[Step 1]${RESET} Executing First Command..."
echo "Hello from Bash Scripting!"
echo ""

# [2] تنفيذ الأمر الثاني: عرض مسار العمل الحالي (Print Working Directory)
echo -e "${YELLOW}[Step 2]${RESET} Current Working Directory (pwd):"
pwd
echo ""

# [3] تنفيذ الأمر الثالث: عرض التاريخ والوقت ومحتويات المجلد الحالي
echo -e "${YELLOW}[Step 3]${RESET} System Date & Directory Overview:"
date "+Date: %Y-%m-%d | Time: %H:%M:%S"
ls -1
echo ""

echo -e "${GREEN}All commands executed successfully.${RESET}"
echo ""

# ------------------------------------------------------------------------------
# إبقاء نافذة الـ Terminal مفتوحة حتى يضغط المستخدم على Enter
# خصوصاً عند تشغيل الملف مباشرة عبر النقر المزدوج في Windows / Git Bash
# الخيار (-r) يمنع تفسير الـ Backslash، والخيار (-p) يعرض الرسالة للمستخدم
# ------------------------------------------------------------------------------
read -r -p "Press Enter to close..."