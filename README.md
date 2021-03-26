# it802f21
* Get GCP 300$ free credit
* Create a project
* Get GPU quotas
* Get gcloud cli works (suggest default zone *--zone=europe-west4-a*)

## create instance
```
gcloud compute instances create carlavm --machine-type=n1-standard-8 --maintenance-policy=TERMINATE \
--accelerator=type=nvidia-tesla-p100-vws,count=1 --image=ubuntu-1804-bionic-v20210325 --image-project=ubuntu-os-cloud \
--boot-disk-size=10GB --boot-disk-type=pd-ssd --boot-disk-device-name=carlavm --create-disk source-snapshot=carla-disk,name=carla-drive,size=20,type=projects/ml-study-293709/zones/europe-west4-a/diskTypes/pd-ssd \
--no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any --tags=carlavm --preemptible
```

## setup
login
```
gcloud compute ssh carlavm
```
change password
```
sudo passwd $USER
```
setup basic reqs
```
sudo curl https://raw.githubusercontent.com/leotimus/it802f21/carla_01/carla.sh | bash
```
_it will take about 10 minutes for each setup_

## access carla instance
login again
```
gcloud compute ssh carlavm -- -L 4000:localhost:4000
```
mount disk before use
```
sudo mount -o discard,defaults /dev/sdb /home/$USER/carla
```
always activate `carla` pyton profile
```
conda activate carla
```
working dir is $HOME/carla
## delete gcp isntance after use
```
gcloud compute instances delete carlavm
```

## remote via NoMachine
```
host: localhost port 4000 or VM's external ip with port opened firewall rule
```
