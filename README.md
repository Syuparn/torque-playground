# torque-playground

docker image to run sample [Torque language](https://v8.dev/docs/torque) source code (only for fun)

# usage

You can run Torque soruce code `src/main.tq` in docker container by following steps.

## use docker image

```bash
$ docker pull ghcr.io/syuparn/torque-playground:latest
$ docker run -it --rm -v $(pwd)/src:/root/src ghcr.io/syuparn/torque-playground:latest bash
root@40f3a14bd005:~# ./build-torque src/main.tq
root@40f3a14bd005:~# ./run-torque
```

## use docker-compose (build yourself)

```bash
$ docker-compose up -d --build
$ docker-compose exec torque bash
root@62fc1449971c:~# ./build-torque src/main.tq
root@62fc1449971c:~# ./run-torque
```
