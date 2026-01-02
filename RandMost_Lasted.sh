#!/system/bin/sh
# @Name: RandMost Manager Pro
# @Auth: TropZh

# ===== 颜色定义 =====
G='\033[1;32m'; R='\033[1;31m'; Y='\033[1;33m'; B='\033[1;34m'; C='\033[1;36m'; W='\033[1;37m'; P='\033[1;35m'; NC='\033[0m'

# ===== 核心配置 =====
# 自动标准化路径
WORK_DIR=$(realpath /sdcard/RandMost 2>/dev/null || echo "/sdcard/RandMost")
SELF_PATH=$(realpath "$0")
UPDATE_URL="https://raw.githubusercontent.com/bunyodbekkanalov-ux/JustForTest/main/RandMost_Lasted.sh"

# 环境初始化
[ ! -d "$WORK_DIR" ] && mkdir -p "$WORK_DIR"

# ===== 1. 加载动画与纯净版 Logo =====
clear
echo -e "${Y}"
echo "  ____                 _淢vc" | sed 's/淢vc//g'
echo " |  _ \  __ _ _ __   __| |"
echo " | |_) |/ _\` | '_ \ / _\` |"
echo " |  _ <| (_| | | | | (_| |"
echo " |_| \_\\__,_|_| |_|\\__,_|"
echo -e "       ${W}RANDMOST SYSTEM PRO${NC}\n"

# 进度条 (5秒加载)
printf " ${W}System Loading [${NC}"
for i in $(seq 1 25); do
    sleep 0.2
    if [ $i -lt 10 ]; then printf "${R}■${NC}";
    elif [ $i -lt 18 ]; then printf "${Y}■${NC}";
    else printf "${G}■${NC}"; fi
done
echo -e "${W}] ${G}OK${NC}"
sleep 0.4

# ===== 2. 主界面循环 =====
while true; do
    clear
    echo -e "${C}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
    echo -e "${C}┃${NC}         ${W}⚡ ${P}RANDMOST OFFICIAL PANEL${NC} ${W}⚡${NC}        ${C}┃${NC}"
    echo -e "${C}┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫${NC}"
    echo -e "${C}┃${NC}  ${G}[1] 📢 系统公告 (System Notice)${NC}          ${C}┃${NC}"
    echo -e "${C}┃${NC}  ${Y}[2] 🚀 检查更新 (Update Script)${NC}          ${C}┃${NC}"
    echo -e "${C}┃${NC}  ${B}[3] 👤 联系作者 (Contact Admin)${NC}          ${C}┃${NC}"
    echo -e "${C}┃${NC}  ${P}[4] 🛠️ 核心功能 (Main Features)${NC}          ${C}┃${NC}"
    echo -e "${C}┃${NC}  ${R}[5] 🗑️ 卸载脚本 (Uninstall SH)${NC}            ${C}┃${NC}"
    echo -e "${C}┃${NC}  ${W}[6] 🚪 退出脚本 (Safe Exit)${NC}               ${C}┃${NC}"
    echo -e "${C}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
    echo -e "   ${W}运行位置: ${Y}$SELF_PATH${NC}"
    printf "   ${C}请选择操作 >> ${NC}"
    read choice

    case $choice in
        1)
            echo -e "\n${G}──────────────── [公告] ────────────────${NC}"
            echo -e "${W}此工具目前正在制作中！${NC}"
            echo -e "${W}请每日更新以保持工具版本最新。${NC}"
            echo -e "${R}⚠ 注意：请不要更改此文件的名字！${NC}"
            echo -e "${Y}(tips: 更新不了请挂梯子)${NC}"
            echo -e "${G}────────────────────────────────────────${NC}"
            echo -e "按回车键返回..."
            read dummy ;;

        2)
            echo -e "\n${Y}📡 正在校验环境安全...${NC}"
            
            if [[ "$SELF_PATH" != "$WORK_DIR"* ]]; then
                echo -e "${R}━━━━━━━━━━━━━━━ 路径错误 ━━━━━━━━━━━━━━━${NC}"
                echo -e "${W}检测到脚本未在规范目录运行：${NC}"
                echo -e "${W}当前: ${R}$SELF_PATH${NC}"
                echo -e "${W}应在: ${G}$WORK_DIR/${NC}"
                echo -e "${Y}请将此脚本移动到 RandMost 文件夹后重试！${NC}"
                echo -e "${R}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                read dummy
            else
                echo -e "${G}✔ 环境匹配成功，开始拉取更新...${NC}"
                TMP_FILE="$WORK_DIR/update_tmp.sh"
                curl -L -k --retry 2 --connect-timeout 20 "$UPDATE_URL" -o "$TMP_FILE"
                
                if [ -s "$TMP_FILE" ] && ! grep -q "404: Not Found" "$TMP_FILE"; then
                    mv "$TMP_FILE" "$SELF_PATH"
                    chmod +x "$SELF_PATH"
                    echo -e "${G}✅ 更新成功！即将自动重启...${NC}"
                    sleep 1.5
                    exec sh "$SELF_PATH"
                else
                    echo -e "${R}❌ 更新失败: 无法连接服务器或链接失效。${NC}"
                    rm -f "$TMP_FILE"
                    read dummy
                fi
            fi ;;

        3)
            echo -e "\n${B}┌──────────────────────────────────────┐${NC}"
            echo -e "  ${W}作者 Discord:${NC} ${G}TropZh${NC}"
            echo -e "${B}└──────────────────────────────────────┘${NC}"
            read dummy ;;

        4)
            echo -e "\n${P}⚠️  提示: 目前没做好QAQ${NC}"
            sleep 1.5 ;;

        5)
            echo -e "\n${R}🚨 正在删除 RandMost 资源并自毁...${NC}"
            rm -rf "$WORK_DIR"
            rm -f "$SELF_PATH"
            echo -e "${G}清理完成，脚本已退出。${NC}"
            exit ;;

        6)
            echo -e "\n${W}退出成功。${NC}"
            exit 0 ;;

        *)
            echo -e "${R}无效选项${NC}"; sleep 0.5 ;;
    esac
done
