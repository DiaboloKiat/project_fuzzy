# project_fuzzy

## Clone repo
```
$ git clone https://github.com/DiaboloKiat/project_fuzzy
$ cd project_fuzzy
```

## Build docker
```
$ cd ~/project_fuzzy/Docker
$ source build.sh <username> <password>
```

## Run docker
```
$ cd ~/project_fuzzy
$ source docker_run.sh
```

## Open another docker terminal
```
$ cd ~/project_fuzzy
$ source docker_join.sh
```

## Open procman in docker
```
$ cd ~/project_fuzzy
$ source catkin_make.sh
$ source environment.sh
$ source start_vrx.sh
```

### procman hot-key
| Hot Key | Function |
|-------------|--------------------|
| Ctrl + S | Start |
| Ctrl + T | Stop |
| Ctrl + R | Restart |
| Ctrl + A | Select All |

## Multi-boat HRVO
- Start 01_core
- Start 02_gazebo_multi
- Start 04_multi_hrvo




