#!/bin/bash
echo "Updating settings.ini"
python settingsupdater.py

echo "Looking for custom mapping"
if [ ! -z "${CUSTOM_MAPPING_URL}" ]
then
  wget -O /plexanisync/custom_mappings.ini ${CUSTOM_MAPPING_URL}
else
  echo "No custom mapping found"
fi

if [ "${INTERVAL}" -gt "0" ]; then
  while true
  do
    (cd /plexanisync && python PlexAniSync.py)
    sleep ${INTERVAL}
  done
else
  (cd /plexanisync && python PlexAniSync.py)
fi 
