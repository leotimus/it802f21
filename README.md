# it802f21
* Get GCP 300$ free credit
* Create a project
* Get gcloud cli works (suggest default zone *--zone=europe-west4-a*)
* Open GCP firewall ports 8000-8010 in GCP and name (*tag*) it `carlavm`

## create instance
```
gcloud compute instances create carlavm --maintenance-policy=TERMINATE --machine-type=n1-standard-8 \
--accelerator="type=nvidia-tesla-p100-vws,count=1" --image=ubuntu-1804-bionic-v20210315a --image-project=ubuntu-os-cloud \
--boot-disk-size=50GB --boot-disk-type=pd-balanced --boot-disk-device-name=instance-1 --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring \
--reservation-affinity=any --tags=carlavm --preemptible
```

## setup
login again
```
gcloud compute ssh carlavm
```
setup basic reqs
```
sudo curl https://raw.githubusercontent.com/leotimus/it802f21/main/carla.sh | bash
```
_it will take about 15 minutes for each setup_

## create carla instance
login again
```
gcloud compute ssh carlavm
```
create carla container
```
docker run -p 8000-8002:8000-8002 --name=carla --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0 carlasim/carla:latest bash -c "SDL_VIDEODRIVER=offscreen ./CarlaUE4.sh -opengl -nosound -carla-rpc-port=8000"
```
_it will take another 10 minutes to get the container up_
