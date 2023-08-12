# Developer Notes

## Best Practices

### [Docker]
#### [Issue] Container exits when using an entrypoint in docker-compose.yaml

If any of the containers defined in the docker-compose.yaml file uses an entrypoint script,
you need to make sure that the script itself runs indefinitely, otherwise the container will exit
as soon as the script ends, specifically, you can either use a hacky command like 'tail -f /dev/null'
(might not always work), or start a service that the container uses

#### [INFO] Some debugging options inside docker containers

Container php-fpm:
- ps aux | grep php-fpm (ensure service php-fpm is running)\
- netstat -an | grep :9000 (check port: if running over IP, as opposed to over Unix socket)\
- nmap localhost -p 9000 (check port: with nmap)\
- service —status-all (check the status of all services)