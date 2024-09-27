$AXFUN

if [ "$AXERON" = false ]; then
    echo "Only Support in Laxeron"
    exit 1
fi

echo "Join and update SETTINGS AIM V7.0"
sleep 2
am start -a android.intent.action.VIEW -d https://whatsapp.com/channel/0029VaeRl4m1Xqucd9LGUT38/129 > /dev/null 2>&1 &
exit 1
print() {
    local text="$1"
    local len=${#text}
    local i=0
    colors=(92)
    while [ $i -lt $len ]; do
        color_index=$((i % ${#colors[@]}))
        color=${colors[$color_index]}
        echo -ne "\e[${color}m${text:$i:1}\e[0m"
        sleep 0.0
        i=$((i+1))
    done
    echo ""
}
local FFMAX="com.dts.freefiremax"
local FFBIASA="com.dts.freefireth"
local FILE="/sdcard/AxeronModules/SetAimV6/settings.xml"
local reso="1080x2400"

print2() {
    local text="$1"
    local len=${#text}
    local i=0
    while [ $i -lt $len ]; do
        echo -n "${text:$i:1}"
        sleep 0.02
        i=$((i+1))
    done
    echo ""
}

Animasi() {
settings put global window_animation_scale 0.5
settings put global transition_animation_scale 0.5
settings put global animator_duration_scale 0.5
}

Maxx() {
settings put system pointer_speed 7 > /dev/null 2>&1
device_config put game_overlay "$FFMAX" mode=2,renderer=vulkan,downscaleFactor=0.9,fps=90
cmd sensorservice set-uid-state "$FFMAX" activity && sleep 2 && cmd package compile -m speed --secondary-dex "$FFMAX" && cmd package bg-dexopt-job -f "$FFMAX"
echo "" && echo "" && am force-stop "$FFMAX"
print "Membuka Game Freefire Max..." && echo ""
cmd notification post -S messaging --conversation "Settings - Aim V6" --message "[ Status ]: ON -- Freefire Max" "Settings -- Aim" "Active successful" > /dev/null 2>&1 &
print2 "Wait..."
sleep 3 && am start -n "$FFMAX"/com.dts.freefireth.FFMainActivity > /dev/null 2>&1
}

Biasaa() {
settings put system pointer_speed 7 > /dev/null 2>&1
device_config put game_overlay "$FFBIASA" mode=2,renderer=vulkan,downscaleFactor=0.9,fps=90
cmd device_config put touchscreen input_drag_min_switch_speed 500
cmd sensorservice set-uid-state "$FFBIASA" activity && sleep 2 && cmd package compile -m speed --secondary-dex "$FFBIASA" && cmd package bg-dexopt-job -f "$FFBIASA"
echo "" && echo "" && am force-stop "$FFBIASA"
print "Membuka Game Freefire Biasa..." && echo ""
cmd notification post -S messaging --conversation "Settings - Aim V6" --message "[ Status ]: ON -- Freefire" "Settings -- Aim" "Active successful" > /dev/null 2>&1 &
print2 "Wait..."
sleep 3 && am start -n "$FFBIASA"/com.dts.freefireth.FFMainActivity > /dev/null 2>&1
}

update_settings() {
    xmlstarlet ed -L \
        -u "/settings/game_settings/game/sensitivity/general" -v "200" \
        -u "/settings/game_settings/game/sensitivity/red_dot" -v "90" \
        -u "/settings/game_settings/game/sensitivity/2x_scope" -v "80" \
        -u "/settings/game_settings/game/sensitivity/4x_scope" -v "70" \
        -u "/settings/game_settings/game/sensitivity/awm_scope" -v "60" \
        -u "/settings/game_settings/game/sensitivity/shotgun" -v "85" \
        -u "/settings/game_settings/game/sensitivity/smg" -v "75" \
        -u "/settings/game_settings/game/sensitivity/sniper" -v "55" \
        -u "/settings/game_settings/game/sensitivity/pistol" -v "95" \
        -u "/settings/game_settings/game/sensitivity/throwables" -v "100" \
        "$FILE"

    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "general" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "red_dot" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "2x_scope" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "4x_scope" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "awm_scope" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "shotgun" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "smg" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "sniper" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "pistol" -n "$FILE"
    xmlstarlet sel -t -m "/settings/game_settings/game/sensitivity" -v "throwables" -n "$FILE"
}

Return() {
files=("Drag_Sttings.xml"
       "Drag_Settings.lua"
       "easydrag.so")

ORIGINAL_FOLDER="/sdcard/AxeronModules/SetAimV6/settings"

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"

mkdir -p "$ORIGINAL_FOLDER"

for file in "${files[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$ORIGINAL_FOLDER/"
        echo "File $file berhasil dikembalikan ke: $ORIGINAL_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files2=("sensitivity.xml"
        "settings.xml")

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles"

for file in "${files2[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$ORIGINAL_FOLDER/"
        echo "File $file berhasil dikembalikan ke: $ORIGINAL_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files3=("reg.json")

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/main"

for file in "${files3[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$ORIGINAL_FOLDER/"
        echo "File $file berhasil dikembalikan ke: $ORIGINAL_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files4=(
    "assetindexer.DoirhHXLq0KN6bXRhcjPC4FcRdw~3D"
    "assetindexer.lllwpoZvwLP6L9hyLxLh~2FKmWSgg~3D"
)

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/avatarassets"

for file in "${files4[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$ORIGINAL_FOLDER/"
        echo "File $file berhasil dikembalikan ke: $ORIGINAL_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files5=(
    "sensibilidad_freefire.xml"
    "sensibilidad_general.cfg"
    "sensibilidad_general.xml"
    "sensibilidad_joystick.cfg"
    "sensibilidad_joystick.xml"
    "sensibilidad_respuesta.cfg"
    "sensibilidad_respuesta.xml"
    "sensibilidad_touch.cfg"
    "sensibilidad_touch.xml"
    "sensibilidad_xy.cfg"
    "sensibilidad_xy.xml"
    "Sensitivity_conf.prop"
)

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"

for file in "${files5[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$ORIGINAL_FOLDER/"
        echo "File $file berhasil dikembalikan ke: $ORIGINAL_FOLDER" > /dev/null 2>&1
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1
    fi
done

########################

files6=("Drag_Sttings.xml"
       "Drag_Settings.lua"
       "easydrag.so")

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"
DESTINATION_FOLDER="/sdcard/AxeronModules/SetAimV6/settings"

for file in "${files6[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done


files7=("sensitivity.xml"
        "settings.xml")

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles"
DESTINATION_FOLDER="/sdcard/AxeronModules/SetAimV6/settings"

for file in "${files7[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files8=("reg.json")

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/main"
DESTINATION_FOLDER="/sdcard/AxeronModules/SetAimV6/settings"

for file in "${files8[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files9=(
    "assetindexer.DoirhHXLq0KN6bXRhcjPC4FcRdw~3D"
    "assetindexer.lllwpoZvwLP6L9hyLxLh~2FKmWSgg~3D"
)

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/avatarassets"
DESTINATION_FOLDER="/sdcard/AxeronModules/SetAimV6/settings"

for file in "${files9[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files10=(
    "sensibilidad_freefire.xml"
    "sensibilidad_general.cfg"
    "sensibilidad_general.xml"
    "sensibilidad_joystick.cfg"
    "sensibilidad_joystick.xml"
    "sensibilidad_respuesta.cfg"
    "sensibilidad_respuesta.xml"
    "sensibilidad_touch.cfg"
    "sensibilidad_touch.xml"
    "sensibilidad_xy.cfg"
    "sensibilidad_xy.xml"
    "Sensitivity_conf.prop"
)

SOURCE_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"
DESTINATION_FOLDER="/sdcard/AxeronModules/SetAimV6/settings"

for file in "${files10[@]}"; do
    SOURCE_FILE="$SOURCE_FOLDER/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1
    fi
done
}

MaxxFf() {
Return
files=("Drag_Sttings.xml"
       "Drag_Settings.lua"
       "easydrag.so")

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files2=("sensitivity.xml"
        "settings.xml")

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files2[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files3=("reg.json")

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/main"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files3[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files4=(
    "assetindexer.DoirhHXLq0KN6bXRhcjPC4FcRdw~3D"
    "assetindexer.lllwpoZvwLP6L9hyLxLh~2FKmWSgg~3D"
)

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/avatarassets"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files4[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files5=(
    "sensibilidad_freefire.xml"
    "sensibilidad_general.cfg"
    "sensibilidad_general.xml"
    "sensibilidad_joystick.cfg"
    "sensibilidad_joystick.xml"
    "sensibilidad_respuesta.cfg"
    "sensibilidad_respuesta.xml"
    "sensibilidad_touch.cfg"
    "sensibilidad_touch.xml"
    "sensibilidad_xy.cfg"
    "sensibilidad_xy.xml"
    "Sensitivity_conf.prop"
)

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefiremax/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files5[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1
    fi
done
}

BiasaFf() {
Return
files=("Drag_Sttings.xml"
       "Drag_Settings.lua"
       "easydrag.so")

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files2=("sensitivity.xml"
        "settings.xml")

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files2[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files3=("reg.json")

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/main"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files3[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files4=(
    "assetindexer.DoirhHXLq0KN6bXRhcjPC4FcRdw~3D"
    "assetindexer.lllwpoZvwLP6L9hyLxLh~2FKmWSgg~3D"
)

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/avatarassets"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files4[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1 &
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1 &
    fi
done

files5=(
    "sensibilidad_freefire.xml"
    "sensibilidad_general.cfg"
    "sensibilidad_general.xml"
    "sensibilidad_joystick.cfg"
    "sensibilidad_joystick.xml"
    "sensibilidad_respuesta.cfg"
    "sensibilidad_respuesta.xml"
    "sensibilidad_touch.cfg"
    "sensibilidad_touch.xml"
    "sensibilidad_xy.cfg"
    "sensibilidad_xy.xml"
    "Sensitivity_conf.prop"
)

DESTINATION_FOLDER="/sdcard/Android/data/com.dts.freefireth/files/contentcache/Temp/android/MultiThread/CompulsoryRes/gameassetbundles/config"

mkdir -p "$DESTINATION_FOLDER"

for file in "${files5[@]}"; do
    SOURCE_FILE="/sdcard/AxeronModules/SetAimV6/settings/$file"
    if [ -e "$SOURCE_FILE" ]; then
        mv "$SOURCE_FILE" "$DESTINATION_FOLDER/"
        echo "File $file berhasil dipindahkan ke: $DESTINATION_FOLDER" > /dev/null 2>&1
    else
        echo "File $file tidak ditemukan di: $SOURCE_FILE" > /dev/null 2>&1
    fi
done
}

menu() {
    for arg in "$@"; do
        case $arg in
            Max)
                ff_max "$@"
                ;;
            Biasa)
                ff_biasa "$@"
                ;;
        esac
    done
}

x() {
exit 1
echo ""
}

pilihan() {
echo -e "\e[36m     _____[ MENU ]_____\e[0m" && sleep 0.5
echo "╭---------------✧-------------»"
echo "│ 1. Perubahan Resolusi"
echo "│ 2. Perubahan Dpi V1"
echo "│ 3. Perubahan Dpi V2"
echo "│ 4. Perubahan Dpi V3"
echo "╰---------------✧-------------»"
    case $1 in
        1)
            echo "➥ Anda memilih opsi 1"
            wm size "$reso"
            ;;
        2)
            echo "➥ Anda memilih opsi 2"
            wm density 250
            ;;
        3)
            echo "➥ Anda memilih opsi 3"
            wm density 200
            ;;
        4)
            echo "➥ Anda memilih opsi 4"
            wm density 190
            ;;
        *)
            echo "Pilihan tidak valid: $1" && x
            ;;
    esac
}

ff_max() {

echo ""
echo ""
echo -e "\033[0;31m█▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀   ▄▀█ █ █▀▄▀█\033[0m"
echo -e "\033[0;31m▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█   █▀█ █ █░▀░█\033[0m"
echo ""
echo ""
sleep 0.5
echo -e "  \e[92m>>Welcome To Module SETTINGS AIM - Version 6.0<<\e[0m"
sleep 0.5
echo ""
print "> { Developer              / @Chermodsc        } <"
print "> { Version Module         / 6.0               } <"
echo ""
echo ""
sleep 2
pilihan "$@"

if [ -f "$FILE" ]; then
    echo ""
else
    echo ""
    echo "Eror || File settings.xml Tidak ada" && x
fi

Animasi
update_settings > /dev/null 2>&1 &
MaxxFf
Maxx
}

ff_biasa() {

echo ""
echo ""
echo -e "\033[0;31m█▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀   ▄▀█ █ █▀▄▀█\033[0m"
echo -e "\033[0;31m▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█   █▀█ █ █░▀░█\033[0m"
echo ""
echo ""
sleep 0.5
echo -e "  \e[92m>>Welcome To Module SETTINGS AIM - Version 6.0<<\e[0m"
sleep 0.5
echo ""
print "> { Developer              / @Chermodsc        } <"
print "> { Version Module         / 6.0               } <"
echo ""
sleep 1
echo ""
sleep 2
pilihan "$@"

if [ -f "$FILE" ]; then
    echo ""
else
    echo ""
    echo "Eror || File settings.xml Tidak ada" && x
fi

Animasi
update_settings > /dev/null 2>&1 &
BiasaFf
Biasaa
}

menu "$@"

