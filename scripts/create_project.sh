#!/usr/bin/env bash
# ==============================================================================
# Script Name  : create_project.sh
# Description  : سكربت تفاعلي لأتمتة إنشاء هيكل مشروع ويب متكامل مع التحقق من
#                المدخلات والشروط المتداخلة (Variables, User Input, Nested If).
#                Interactive web project scaffolding script with input
#                validation, whitespace checks, and nested confirmation prompts.
# Course Ref   : Learn Command Line (Elzero Web School) - Lessons #24 & #25
# Author       : Ammar Al-Najjar (https://github.com/Ammar-1993)
# Usage        : bash scripts/create_project.sh
# ==============================================================================

# ------------------------------------------------------------------------------
# تعريف الألوان لتمييز رسائل النجاح، التحذير، والأخطاء
# ------------------------------------------------------------------------------
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo -e "${CYAN}==================================================${RESET}"
echo -e "${CYAN}       Web Project Scaffolding Generator          ${RESET}"
echo -e "${CYAN}==================================================${RESET}"
echo ""

# ------------------------------------------------------------------------------
# [1] استقبال اسم المشروع من المستخدم وتخزينه في متغير (بدون مسافات حول =)
# ------------------------------------------------------------------------------
read -r -p "Enter Your Project Name: " project

# إزالة المسافات الزائدة للتحقق من أن المستخدم لم يُدخل مسافات فارغة فقط
# (تطوير عملي للملاحظة المذكورة في الدرس 25 حول عدم احتساب المسافة كطول صفر)
trimmed_project="${project// /}"

# ------------------------------------------------------------------------------
# [2] الشرط الرئيسي (Main If): التحقق من أن اسم المشروع غير فارغ
# المعامل (-z) يتحقق هل طول النص يساوي صفراً أم لا
# ------------------------------------------------------------------------------
if [ -z "$trimmed_project" ]; then
  echo -e "${RED}[Error] Project name can't be empty or whitespace only.${RESET}"
  exit 1
elif [ -d "$project" ]; then
  # فحص أمان إضافي: التأكد من عدم وجود مجلد بنفس الاسم مسبقاً لتجنب الاستبدال
  echo -e "${YELLOW}[Warning] Directory '$project' already exists. Operation aborted.${RESET}"
  exit 1
else
  # ----------------------------------------------------------------------------
  # [3] الشرط المتداخل (Nested If): طلب تأكيد المستخدم قبل بدء الإنشاء
  # ----------------------------------------------------------------------------
  read -r -p "Create project '$project'? (yes/no): " answer

  # تحويل الإجابة إلى أحرف صغيرة لقبول YES / Yes / yes أو y بمرونة
  answer_lower="${answer,,}"

  if [ "$answer_lower" = "yes" ] || [ "$answer_lower" = "y" ]; then
    echo ""
    echo -e "${CYAN}Creating project structure for '$project'...${RESET}"

    # إنشاء المجلدات المتداخلة دفعة واحدة باستخدام (-p)
    mkdir -p "$project/css" "$project/js" "$project/images"

    # إنشاء الملفات الأساسية
    touch "$project/css/style.css" "$project/js/main.js"

    # كتابة قالب HTML5 أساسي داخل index.html باستخدام تقنية Heredoc (EOF) من الدرس 23
    cat > "$project/index.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>$project</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
  <h1>Welcome to $project</h1>
  <script src="js/main.js"></script>
</body>
</html>
EOF

    # إضافة تعليق ابتدائي منظم داخل ملفات CSS و JS
    echo "/* Main Stylesheet for $project */" > "$project/css/style.css"
    echo "// Main JavaScript entry point for $project" > "$project/js/main.js"

    echo -e "${GREEN}[Success] '$project' project is ready!${RESET}"
    echo ""
    echo "Generated structure:"
    echo "  $project/"
    echo "  ├── index.html"
    echo "  ├── css/"
    echo "  │   └── style.css"
    echo "  ├── js/"
    echo "  │   └── main.js"
    echo "  └── images/"
  else
    echo -e "${YELLOW}[Cancelled] Project creation was cancelled.${RESET}"
  fi
fi