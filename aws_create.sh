#!/bin/sh

progress_bar() {
  duration="$1"
  bar_length=75
  sleep_duration=$(echo "$duration / $bar_length" | bc)

  i=0
  while [ "$i" -le "$bar_length" ]; do
    printf "\r["

    j=0
    while [ "$j" -lt "$i" ]; do
      printf "="
      j=$((j+1))
    done

    printf ">"

    j=$((i+1))
    while [ "$j" -lt "$bar_length" ]; do
      printf " "
      j=$((j+1))
    done

    printf "] %d%%" "$((i*100/bar_length))"

    sleep "$sleep_duration"
    i=$((i+1))
  done

  printf "\n"
}


INSTANCENAME=k8s

echo "Creating $INSTANCENAME server"

INSTANCETYPE=t2.micro

AMI_ID=ami-0f5ee92e2d63afc18

ZONE=subnet-058dfc6e7a1c552f2

COUNTS=1

INSTANCE_ID=$(aws ec2 run-instances --image-id $AMI_ID --count $COUNTS --instance-type $INSTANCETYPE --key-name filinta --security-group-ids sg-005049fa3e18bf8df --subnet-id $ZONE --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$INSTANCENAME'}]' --query 'Instances[0].InstanceId'  --output text)

progress_bar 75

echo "$INSTANCENAME Server Created Successfully!"


PUBLICIP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[].Instances[].PublicIpAddress' | cut -d "[" -f2 | cut -d "]" -f1 | tr -d '" ')

PCLINE="[$INSTANCENAME]
$PUBLICIP ansible_user=ubuntu"

PHLINE="[$INSTANCENAME]\n\n$PUBLICIP ansible_user=ubuntu"

PATH1="/var/lib/jenkins/workspace/$INSTANCENAME"
PATH2="/root/.jenkins/workspace/$INSTANCENAME"

if [ "$(echo "$PWD")" = "$PATH1" ]; then
  echo "$PCLINE" > hosts
elif [ "$(echo "$PWD")" = "$PATH2" ]; then
  echo "$PCLINE" > hosts
else
  echo "$PHLINE" > hosts
fi

