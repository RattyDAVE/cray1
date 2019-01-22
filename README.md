# A docker container containing a fully running Cray 1 Supercomputer

Use https://github.com/RattyDAVE/cray1/issues to send feedback, issues, comments and general chat.

# Part of the retro mini and mainframe series.

* https://hub.docker.com/r/rattydave/alpine-multics - Fully Running Multics mainframe time sharing operating system.
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-tss - Fully running version 3.0 of IBM's Time Sharing System/370
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-vm370 - vm370 Emulator with Robert O'Hara's Six Pack
* https://hub.docker.com/r/rattydave/docker-ubuntu-hercules-mvs - Fully running MVS 3.8j Tur(n)key 4- System. IBM Mainframe.
* https://hub.docker.com/r/rattydave/alpine-simh/ - AT&T, Data General, DEC PDPs and VAXen, Honeywell, HP and others. All with OSs.
* https://hub.docker.com/r/rattydave/cray1/ - Cray 1 Supercomputer

## Thank you to the following.

* http://www.modularcircuits.com/blog/articles/the-cray-files/


## Usage

```
docker run -dit --name cray1 \
           -p 2222:22 \
           rattydave/cray1:latest
```

## Access

### Connection Method 1

To get the IP address of the running container.
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cray1
```
To access the terminal screens either connect via SSH to port 2222 of the running container.

- Username : root
- Password : root

then when you have the prompt

```
tmux attach
```

### Connection Method 2

From the host machine:

```
docker exec -it cray1 tmux attach
```

### Usage

Once in you are presented with tmux running 4 windows.

- 0:cray_xmp_sim* 
- 20003:ampex80term  
- 20004:ampex80term  
- 20006:ampex80term

To ease in the debugging each window has the identification the same as the connection port. 

To switch between screens press ```CTRL-b``` then ```n```. More information on tmux at https://tmuxcheatsheet.com/
