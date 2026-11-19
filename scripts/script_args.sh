#!/usr/bin/env bash
# ==============================================================================
# Script Name  : script_args.sh
# Description  : استقبال ومعالجة معاملات السكربت (Script Arguments) مع التحقق
#                من عدد المعاملات وتعيين قيم افتراضية احترافية.
#                Demonstrates positional arguments ($1, $2, $3), argument count
#                ($#), usage validation, and safe default fallback values.
# Course Ref   : Learn Command Line (Elzero Web School) - Lesson #26
# Author       : Ammar Al-Najjar (https://github.com/Ammar-1993)
# Usage        : bash scripts/script_args.sh "<Project Name>" "<Author>" "<Version>"
# Example      : bash scripts/script_args.sh "Laravel App" "Ammar Al-Najjar" "1.0.0"
# ==============================================================================

# ------------------------------------------------------------------------------
# تعريف الألوان لتنسيق المخرجات
# ------------------------------------------------------------------------------
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# ------------------------------------------------------------------------------
# [1] التحقق من تمرير معامل واحد على الأقل باستخدام ($#)
# الرمز ($#) يُرجع إجمالي عدد المعاملات المُمرَّرة للسكربت
# الرمز ($0) يُرجع اسم السكربت نفسه
# ------------------------------------------------------------------------------
if [ "$#" -lt 1 ]; then
  echo -e "${RED}[Error] Missing required project name argument.${RESET}"
  echo ""
  echo -e "${YELLOW}Usage:${RESET}"
  echo "  bash $0 \"<Project Name>\" \"<Author Name>\" \"<Version>\""
  echo ""
  echo -e "${YELLOW}Example:${RESET}"
  echo "  bash $0 \"Laravel Project\" \"Ammar Al-Najjar\" \"1.0.0\""
  exit 1
fi

# ------------------------------------------------------------------------------
# [2] إسناد المعاملات إلى متغيرات واضحة مع قيم افتراضية عند عدم تمرير الثاني أو الثالث
# الصيغة ${2:-"Default"} تعني: استخدم $2 إن وُجد، وإلا فاستخدم القيمة الافتراضية
# ملاحظة: عند تمرير نص يحتوي مسافات يجب وضعه داخل علامتي تنصيص "مثل هذا"
# ------------------------------------------------------------------------------
project_name="$1"
created_by="${2:-Anonymous Developer}"
version="${3:-1.0.0}"

# ------------------------------------------------------------------------------
# [3] طباعة بطاقة ملخص منظمة بجميع البيانات المستقبلة
# ------------------------------------------------------------------------------
echo -e "${CYAN}==================================================${RESET}"
echo -e "${GREEN}           Project Metadata Summary               ${RESET}"
echo -e "${CYAN}==================================================${RESET}"
echo -e "  ${YELLOW}Project Name :${RESET} $project_name"
echo -e "  ${YELLOW}Created By   :${RESET} $created_by"
echo -e "  ${YELLOW}Version      :${RESET} v$version"
echo -e "${CYAN}--------------------------------------------------${RESET}"
echo -e "  ${YELLOW}Script Name  :${RESET} $0"
echo -e "  ${YELLOW}Args Count   :${RESET} $#"
echo -e "  ${YELLOW}All Args     :${RESET} $*"
echo -e "${CYAN}==================================================${RESET}"