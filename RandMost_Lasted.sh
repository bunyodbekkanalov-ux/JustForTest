#!/system/bin/sh
# @Name: RandMost Manager Pro
# @Auth: TropZh

# ===== 颜色定义 =====
G='\033[1;32m'; R='\033[1;31m'; Y='\033[1;33m'; B='\033[1;34m'; C='\033[1;36m'; W='\033[1;37m'; P='\033[1;35m'; NC='\033[0m'

# ===== 核心配置 =====
WORK_DIR=$(realpath /sdcard/RandMost 2>/dev/null || echo "/sdcard/RandMost")
SELF_PATH=$(realpath "$0")
UPDATE_URL="https://raw.githubusercontent.com/bunyodbekkanalov-ux/JustForTest/main/RandMost_Lasted.sh"

[ ! -d "$WORK_DIR" ] && mkdir -p "$WORK_DIR"

# ===== 1. 加载动画 (5秒炫彩) =====
clear
echo -e "${Y}"
echo "  ____                 _"
echo " |  _ \  __ _ _ __   __| |"
echo " | |_) |/ _\` | '_ \ / _\` |"
echo " |  _ <| (_| | | | | (_| |"
echo " |_| \_\\__,_|_| |_|\\__,_|"
echo -e "       ${W}RANDMOST SYSTEM PRO${NC}\n"

printf " ${W}System Loading [${NC}"
for i in $(seq 1 25); do
    sleep 0.2
    [ $i -lt 10 ] && printf "${R}■${NC}" || { [ $i -lt 18 ] && printf "${Y}■${NC}" || printf "${G}■${NC}"; }
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
            read -p "按回车键返回..." dummy ;;

        2)
            echo -e "\n${Y}📡 正在同步云端数据...${NC}"
            if [[ "$SELF_PATH" != "$WORK_DIR"* ]]; then
                echo -e "${R}❌ 错误：脚本未在 $WORK_DIR 运行！${NC}"
                read -p "按回车继续..." dummy
            else
                TMP_FILE="$WORK_DIR/update_tmp.sh"
                FIXED_URL=$(echo $UPDATE_URL | sed 's|github.com|raw.githubusercontent.com|g' | sed 's|/blob/|/|g')
                HTTP_CODE=$(curl -L -k -s -w "%{http_code}" -A "Mozilla/5.0" --retry 2 --connect-timeout 15 "${FIXED_URL}?t=$(date +%s)" -o "$TMP_FILE")
                if [ "$HTTP_CODE" -eq 200 ] && [ -s "$TMP_FILE" ]; then
                    if head -n 10 "$TMP_FILE" | grep -qiE "html|doctype|404|Access Denied"; then
                        echo -e "${R}❌ 校验失败：捕获到无效数据页面${NC}"
                        rm -f "$TMP_FILE"
                    else
                        mv "$TMP_FILE" "$SELF_PATH"
                        chmod +x "$SELF_PATH"
                        echo -e "${G}✅ 更新成功！正在重启...${NC}"
                        sleep 1.2; exec sh "$SELF_PATH"
                    fi
                else
                    echo -e "${R}❌ 下载失败 (状态码: $HTTP_CODE)${NC}"
                    rm -f "$TMP_FILE"
                fi
                read -p "按回车继续..." dummy
            fi ;;

        3)
            echo -e "\n${B}┌──────────────────────────────────────┐${NC}"
            echo -e "  ${W}作者 Discord:${NC} ${G}TropZh${NC}"
            echo -e "${B}└──────────────────────────────────────┘${NC}"
            read -p "按回车返回..." dummy ;;

        4)
            while true; do
                clear
                echo -e "${P}┏━━━━━━━━━━━━━ [ 核心功能 ] ━━━━━━━━━━━━━┓${NC}"
                echo -e "${P}┃${NC}  ${G}[1] 🔍 检测本机 IP 地址${NC}              ${P}┃${NC}"
                echo -e "${P}┃${NC}  ${W}[B] 返回主菜单${NC}                        ${P}┃${NC}"
                echo -e "${P}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
                printf "   ${P}功能指令 >> ${NC}"
                read feat_choice
                case $feat_choice in
                    1)
                        echo -e "\n${C}🌐 正在查询网络环境...${NC}"
                        # 使用 ip-api 获取详细信息，使用 curl 抓取
                        IP_DATA=$(curl -s -k --connect-timeout 10 "http://ip-api.com/line/?fields=query,country,city,isp")
                        if [ -n "$IP_DATA" ]; then
                            echo -e "${G}┌─────────────── IP 信息 ───────────────┐${NC}"
                            # 将多行结果转为数组显示
                            echo "$IP_DATA" | sed 's/^/  /' 
                            echo -e "${G}└───────────────────────────────────────┘${NC}"
                        else
                            echo -e "${R}❌ 查询失败，请检查网络连接${NC}"
                        fi
                        read -p "按回车继续..." dummy ;;
                    [Bb]) break ;;
                    *) echo -e "${R}无效选项${NC}"; sleep 0.5 ;;
                esac
            done ;;

        5) echo -e "\n${R}🚨 正在自毁...${NC}"; rm -rf "$WORK_DIR"; rm -f "$SELF_PATH"; exit ;;
        6) echo -e "\n${W}退出成功。${NC}"; exit 0 ;;
        *) echo -e "${R}无效选项${NC}"; sleep 0.5 ;;
    esac
done
