$AXFUN

echo ""
echo ""
echo " Proses Uninstall [ • ]"
wm size reset
wm density reset
echo ""
echo ""
sleep 5

Notif() {
cmd notification post -S messaging --conversation "Settings - Aim V6" --message "[ Status ]: OF -- SetAim" "Settings -- Aim" "OF successful" > /dev/null 2>&1 &
}

uninstall() {
settings put system pointer_speed 1
cmd device_config delete touchscreen input_drag_min_switch_speed
cmd sensorservice set-uid-state com.dts.freefiremax idle
cmd sensorservice set-uid-state com.dts.freefireth idle
am force-stop com.dts.freefireth
am force-stop com.dts.freefiremax
}
uninstall > /dev/null 2>&1


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

echo ""
sleep 1
echo " Uninstall berhasil."
echo ""
Notif
