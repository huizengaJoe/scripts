touch sample.txt

mkdir userdata
mount /dev/xvdh1 userdata 
cd userdata

SAMPLE_DATA=$(cat meta.js | python -c 'import json,sys; unwrap1=json.load(sys.stdin)[0]; map=json.loads(unwrap1); print map["sample"];')

echo $SAMPLE_DATA > /root/sample.txt
