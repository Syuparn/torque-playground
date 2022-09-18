# torque-playground

docker image to run sample [Torque language](https://v8.dev/docs/torque) source code (only for fun)

# usage

You can run Torque soruce code `src/main.tq` in docker container by following steps.

## docker-compose

```bash
$ docker-compose up -d --build
$ docker-compose exec torque bash
# ./build-torque src/main.tq
# ./run-torque
```